<?php

abstract class BaseMigration extends Migration {
  public function __construct() {
    // Always call the parent constructor first for basic setup
    parent::__construct();

    // With migrate_ui enabled, migration pages will indicate people involved in
    // the particular migration, with their role and contact info. We default the
    // list in the shared class; it can be overridden for specific migrations.
    $this->team = array(
      new MigrateTeamMember('Favio Manriquez', 'favio@favrik.com', t('Dev')),
    );

    // Individual mappings in a migration can be linked to a ticket or issue
    // in an external tracking system. Define the URL pattern here in the shared
    // class with ':id:' representing the position of the issue number, then add
    // ->issueNumber(1234) to a mapping.
    $this->issuePattern = 'http://drupal.org/node/:id:';
  }
}


/**
 * The BeerNodeMigration uses the migrate_example_beer_node table as source
 * and creates Drupal nodes of type 'Beer' as destination.
 */
class LeonarteMigration extends BaseMigration {
  public function __construct() {
    parent::__construct();
    $this->description = t('Las obras de arte de LEONARTE');

    $this->map = new MigrateSQLMap($this->machineName,
      array(
        'id' => array(
          'type' => 'int',
          'not null' => TRUE,
          'description' => 'Creation Id',
          'alias' => 'c',
        )
      ),
      MigrateDestinationNode::getKeySchema()
    );

    // We have a more complicated query. The Migration class fundamentally
    // depends on taking a single source row and turning it into a single
    // Drupal object, so how do we deal with zero or more terms attached to
    // each node? One way (demonstrated for MySQL) is to pull them into a single
    // comma-separated list.
    $query = db_select('creations', 'c')
             ->fields('c', array('id', 'title', 'specifications', 'cats.name as cat'));
    $query->join('creation_categories', 'cc', 'c.id = cc.creation_id');
    $query->join('categories', 'cats', 'cc.category_id = cats.id');
    $query->leftJoin('creation_images', 'ci', 'c.id = ci.creation_id');
    $query->addExpression('GROUP_CONCAT(ci.creation_id)', 'images');

    // By default, MigrateSourceSQL derives a count query from the main query -
    // but we can override it if we know a simpler way
    $count_query = db_select('creations', 'c');
    $count_query->addExpression('COUNT(id)', 'cnt');

    // Passing the cache_counts option means the source count (shown in
    // drush migrate-status) will be cached - this can be very handy when
    // dealing with a slow source database.
    $this->source = new MigrateSourceSQL($query, array(), $count_query,
      array('cache_counts' => TRUE));

    $this->destination = new MigrateDestinationNode('obra_de_arte');

    // Mapped fields
    $this->addFieldMapping('title', 'title');

    $this->addFieldMapping('nid', 'id')
         ->description(t('Preserve old creations ID as nid in Drupal'));

    $this->addFieldMapping('field_informaci_n', 'specifications')
         ->callbacks(array($this, 'informationValue'));

    $this->addFieldMapping('field_dimensiones', 'specifications')
         ->callbacks(array($this, 'dimensionsValue'));

    $this->addFieldMapping('field_a_o', 'specifications')
         ->callbacks(array($this, 'yearValue'));

    $this->addFieldMapping('field_categor_a', 'cat');

    $this->addFieldMapping('field_imagen', 'images'); 


    if (module_exists('path')) {
      $this->addFieldMapping('path')
           ->issueGroup(t('DNM'));
      if (module_exists('pathauto')) {
        $this->addFieldMapping('pathauto')
             ->issueGroup(t('DNM'));
      }
    }
    if (module_exists('statistics')) {
      $this->addUnmigratedDestinations(array('totalcount', 'daycount', 'timestamp'));
    }
  }

  public function informationValue($value) {
    $exploded = explode('/', $value);

    return $exploded[0];
  }

  public function dimensionsValue($value) {
    $exploded = explode('/', $value);
    $count = count($exploded);

    if (3 == $count) {
      return $exploded[1];
    }

    return '';
  }

  public function yearValue($value) {
    $exploded = explode('/', $value);
    $count = count($exploded);

    if ($count > 1) {
      return $exploded[$count - 1];
    }

    return '';
  }

}


