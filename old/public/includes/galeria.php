<div class="navigation galeria">
    <ul>
        <li>
            <a href="<?php echo $web_path; ?>galeria/"><img src="<?php echo $web_path; ?>images/galeria.jpg" alt="Galer&iacute;a" /></a>
        </li>
        <li>
            <a href="<?php echo $web_path; ?>galeria/pintura/">Pintura</a>
        </li>
        <li>
            <a href="<?php echo $web_path; ?>galeria/escultura/">Escultura</a>
        </li>
        <li>
            <a href="<?php echo $web_path; ?>galeria/piedras/">Piedras</a>
        </li>
    </ul>
</div>

<div class="content galeriaContent">
    <div class="thumbnails">
        <?php foreach ($thumbnails as $id => $image): ?>
        <div class="thumb">
            <a href="<?php echo $web_path; ?>galeria/<?php echo $category; ?><?php echo $image['creation_id']; ?>/<?php echo $image['image_id']; ?>"><img src="<?php echo $web_path; ?>galeria/images/<?php echo $id; ?>_t.jpg" /></a>
        </div>
        <?php endforeach; ?>
    </div>

    <div class="image">
        <?php if ($display_image): ?>
            <img src="<?php echo $web_path; ?>galeria/images/<?php echo $display_image; ?>.jpg" />
            <h2><?php echo $creation['title']; ?></h2>
            <p><?php echo $creation['specifications']; ?></p>
        <?php endif; ?>
    </div>
</div>

<div style="clear:both"></div>
