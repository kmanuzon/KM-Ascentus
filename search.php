<?php

require 'config.php';

/**
 *
 * @param string
 * @return array
 */
function search($query)
{
    if (empty($query)) return [];

    $query_string = '%' . $query . '%';

    $db = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    if ($db->connect_errno) return [];

    $sql = "SELECT "
        . "`eateries`.*, `eatery_owners`.`first_name`, `eatery_owners`.`last_name`, "
        . "`eatery_owners`.`phone`, `eatery_type`.`type_name` "
        . "FROM `eateries`"
        . "INNER JOIN `eatery_owners` ON `eatery_owners`.`id` = `eateries`.`owner` "
        . "INNER JOIN `eatery_type` ON `eatery_type`.`id` = `eateries`.`type` "
        . "WHERE `eatery_type`.`type_name` LIKE ? "
        . "OR `eatery_owners`.`first_name` LIKE ? "
        . "OR `eatery_owners`.`last_name` LIKE ? "
        . "OR `eatery_owners`.`phone` LIKE ? "
        . "OR `eateries`.`name` LIKE ? "
        . "OR `eateries`.`city` LIKE ? "
        . "OR `eateries`.`state` LIKE ? "
        . "OR `eateries`.`zip` LIKE ? ";
    $stmt = $db->prepare($sql);
    $stmt->bind_param(
        'ssssssss',
        $query_string,
        $query_string,
        $query_string,
        $query_string,
        $query_string,
        $query_string,
        $query_string,
        $query_string
    );
    $stmt->execute();
    $result = $stmt->get_result();
    $stmt->close();
    return $result->fetch_all(MYSQLI_ASSOC);
}

header('Content-Type: application/json', true);
print json_encode(search($_GET['q']));
