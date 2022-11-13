<?php

require_once 'check_session.php';

$save_email_in = !empty($_COOKIE['email_in']) ? $_COOKIE['email_in'] : '';
$save_name = !empty($_COOKIE['name']) ? $_COOKIE['name'] : '';
$save_surname = !empty($_COOKIE['surname']) ? $_COOKIE['surname'] : '';
$save_email_reg = !empty($_COOKIE['email_reg']) ? $_COOKIE['email_reg'] : '';

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/form_style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WeiMovie</title>
</head>
<body>
    <div class="header_background"></div>
    <div class="container header">
        <a href="http://weimovie.ru/"><div class="logo"></div></a>

        <?php if ($auth == 1): ?>
            <div class="name_out_wrap push">
                <p class="name"> <?php print_r($_SESSION['USER'][0]['email_user']); ?> </p>
                <a class="btn btn_white push" href="logout.php">Выйти</a>
            </div>
        <?php else: ?>
            <button class="btn btn_white push" data-path="input_user">Войти</button>
            <button class="btn btn_white" data-path="registration_user">Регистрация</button>
        <?php endif; ?>

    </div>
    

    <div class="modals">
		<div class="modal_overlay">
			<div class="modal modal_in" data-target="input_user">
            <p class="modal_name">Введите данные для входа</p>
				<form action="input.php" method="post">
                    <div class="text_field">
                        <label class="text_field_label" for="email_in">Электронная почта</label>
                        <input class="text_field_input" type="email" name="email_in" id="email_in" placeholder="Электронная почта" value="<?php echo $save_email_in; ?>" required>
                    </div>
                    <div class="text_field">
                        <label class="text_field_label" for="password_in">Пароль</label>
                        <input class="text_field_input" type="password" name="password_in" id="password_in" placeholder="Пароль" required>
                    </div>
                    <button class="btn btn_reg_in" type="submit">Войти</button>
                </form>
			</div>
            <div class="modal modal_reg" data-target="registration_user">
                <p class="modal_name">Введите данные для регистрации</p>
                <form action="registration.php" method="post">
                    <div class="text_field">
                        <label class="text_field_label" for="name">Имя</label>
                        <input class="text_field_input" type="text" name="name" id="name" placeholder="Имя" 
                        oninvalid="this.setCustomValidity('Имя должно состоять их русских букв, разрешены пробелы и дефисы')" 
                        onchange="try{setCustomValidity('')}catch(e){}" 
                        pattern="^[А-Яа-яЁё\s\-]+$" value="<?php echo $save_name; ?>" required>
                    </div>
                    <div class="text_field">
                        <label class="text_field_label" for="surname">Фамилия</label>
                        <input class="text_field_input" type="text" name="surname" id="surname" placeholder="Фамилия" 
                        oninvalid="this.setCustomValidity('Фамилия должна состоять их русских букв, разрешены пробелы и дефисы')" 
                        onchange="try{setCustomValidity('')}catch(e){}" 
                        pattern="^[А-Яа-яЁё\s\-]+$" value="<?php echo $save_surname; ?>" required>
                    </div>
                    <div class="text_field">
                        <label class="text_field_label" for="email_reg">Электронная почта</label>
                        <input class="text_field_input" type="email" name="email_reg" id="email_reg" placeholder="Электронная почта" 
                        oninvalid="this.setCustomValidity('Некорректная электронная почта')" 
                        onchange="try{setCustomValidity('')}catch(e){}"
                        pattern="^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$" value="<?php echo $save_email_reg; ?>" required>
                    </div>
                    <div class="text_field">
                        <label class="text_field_label" for="password_reg">Пароль</label>
                        <input class="text_field_input" type="password" onChange="checkPassword()" name="password_reg" id="password_reg" placeholder="Пароль" required>
                    </div>
                    <div class="text_field">
                        <label class="text_field_label" for="repeat_password_reg">Повтор пароля</label>
                        <input class="text_field_input" type="password" onChange="checkPassword()" name="repeat_password_reg" id="repeat_password_reg" placeholder="Повтор пароля" required>
                    </div>
                    <div>
                        <input type="checkbox"required id="agreement" name="agreement">
                        <label class="text_field_check_box" for="agreement">Cогласие на обработку персональных данных</label><br><br>
                    </div>
                    <button class="btn btn_reg_in" type="submit">Регистрация</button>
                </form>
			</div>
		</div>
	</div>

    <?php if ($auth_role == "Модератор"): ?>
        <div class="line"></div>
        <div class="container container_btn_add_review">
            <a class="btn btn_white btn_center" href="add_review_view.php">+Добавить отзыв</a>
        </div>
        <div class="line"></div>
    <?php endif; ?>
    
    <?php
        $result_query = $connect->query("SELECT id_review, title_review, description_review, 
        poster_review, date_review, name_user FROM `review` JOIN `user` ON review.id_user = user.id_user ORDER BY `date_review`;");
        $array_reviews = $result_query->fetchAll(PDO::FETCH_ASSOC);
        foreach ($array_reviews as $review) { ?>

            <div class="container container_white">
                <div class="review_container">
                    <div class="review_item_1">
                        <img class="poster" src="posters/<?= $review['poster_review'] ?>" alt="poster">
                    </div>
                    <div class="review_item_2 review_text_title">

                        <a href="show_review.php?id=<?= $review['id_review']?>" 
                        class="btn btn_black"><?= $review['title_review'] ?></a>

                    </div>
                    <div class="review_item_3 review_text_description">
                        <p>
                            Описание:<br>
                            <?= $review['description_review'] ?> 
                        </p>
                    </div>
                    <div class="review_item_4 review_text_user_date">
                        <p>
                            Автор: <?= $review['name_user'] ?><br>Дата добавления: <?= $review['date_review'] ?>
                        </p>
                    </div>
                </div>
            </div>

    <?php
        } 
    ?>

    <script src="js\script.js"></script>

</body>
</html>