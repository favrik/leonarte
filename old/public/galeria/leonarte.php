<?php

class Leonarte {
    private $db_link = null;

    public function __construct($link) {
        $this->db_link = $link;
    }


    public function thumbnails($category_id=null) {
        $sql = 'SELECT DISTINCT i.creation_id, i.image_id FROM creation_images i';
        
        if (!is_null($category_id)) {
            $sql .= ', creation_categories c WHERE i.creation_id = c.creation_id 
                     AND c.category_id = ' . intval($category_id);
        }

        return $this->query($sql, 'image_id');
    }


    public function image($id) {
        $sql = 'SELECT * FROM creations WHERE id = ' . intval($id);

        return $this->query($sql, 'id');
    }

    private function query($sql, $index) {
        $out = array();
        $result = mysql_query($sql, $this->db_link);
        $ref = null;
        while ($row = mysql_fetch_assoc($result)) {
            $ref = $row[$index];

            $out[$ref] = $row;
        }
        
        if (count($out) == 1) {
            $out = $out[$ref];
        }

        return $out;
    }


}
