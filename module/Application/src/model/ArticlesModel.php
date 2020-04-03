<?php


namespace Application\model;


class ArticlesModel
{

    public static function get_article_list()
    {
        $mysqli = new \mysqli('localhost:3306', 'root', 'start', 'af_shop');
        /* check connection */
        if ($mysqli->connect_errno) {
            printf("Connect failed: %s\n", $mysqli->connect_error);
            exit();
        }

        $articles = [];

        /* Select queries return a resultset */
        if ($result = $mysqli->query('select art.article_id, art.article_heading, art.article_added, art.article_subtitle, art.rating, man.manufacturer_name, img.file_name from articles art
                inner join manufacturers man on man.manufacturer_id = art.manufacturer_id
                inner join article_category cat on cat.category_id = art.category_id
                inner join article_images img on img.article_id = art.article_id')) {

            foreach ($result as $res) {
                $articles[] = $res;
            }
            /* free result set */
            $result->close();
        }

        return $articles;
    }

    public static function get_article_detail($id)
    {
        $mysqli = new \mysqli('localhost:3306', 'root', 'start', 'af_shop');
        /* check connection */
        if ($mysqli->connect_errno) {
            printf("Connect failed: %s\n", $mysqli->connect_error);
            exit();
        }

        $articles = [];

        /* Select queries return a resultset */
        if (!($stmt = $mysqli->prepare('select art.article_heading, art.article_added, art.article_subtitle, art.rating, art.article_description, man.manufacturer_name, man.manufacturer_id, img.file_name from articles art
                                                inner join manufacturers man on man.manufacturer_id = art.manufacturer_id
                                                inner join article_category cat on cat.category_id = art.category_id
                                                inner join article_images img on img.article_id = art.article_id
                                              where art.article_id = id'))) {
            echo "Prepare failed: (" . $mysqli->errno . ") " . $mysqli->error;
        }

        /* Prepared statement, stage 2: bind and execute */
        if (!$stmt->bind_param("i", $id)) {
            echo "Binding parameters failed: (" . $stmt->errno . ") " . $stmt->error;
        }
        if (!$stmt->execute()) {
            echo "Execute failed: (" . $stmt->errno . ") " . $stmt->error;
        }

        $result = $stmt->get_result();
        foreach ($result as $res) {
            $articles[] = $res;
        }

        /* free result set */
        $stmt->close();

        return $articles;
    }
}