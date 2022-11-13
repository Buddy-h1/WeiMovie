<?php

require_once 'check_session.php';

if ($auth_role != "Модератор") {
    header('Location: http://weimovie.ru/');
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/form_style.css">
    <link rel="stylesheet" type="text/css" href="css/add_file_style.css">
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

    <div class="container container_white">
        <form action="add_review.php" method="post" enctype="multipart/form-data">
            <div class="text_field"><br>
                <label>Название фильма</label>
                <input maxlength="30" class="text_field_input" type="text" name="title_movie" id="title_movie" required>
            </div>
            <div class="green_border_focus">
                <label>Описание фильма</label><br>
                <textarea maxlength="340" class="form_control_mini" name="description_review" id="description_review" rows="3" required></textarea><br>
                <label>Текст отзыва</label><br>
                <textarea maxlength="10000" class="form_control" name="text_review" id="text_review" rows="3" required></textarea>
            </div>
            <label class="input_file">
                <input type="file" onChange="checkFile()" name="poster_review" id="poster_review" required>
                <span class="input_file_btn">Постер фильма</span>
                <p class="err_text" id="err_type_file"></p>           
            </label>
            <div class="text_field text_field_mt20">
                <label>Ссылка на трейлер фильма</label>
                <input class="text_field_input" type="text" name="link_trailer" id="link_trailer">
            </div>
            <input class="input_file_btn" type="submit" value="Отправить"><br><br>
        </form>
    </div>

    <script src="js\script.js"></script>

</body>
</html>

