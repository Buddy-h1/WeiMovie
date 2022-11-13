const btns = document.querySelectorAll('.btn_white');
const modalOverlay = document.querySelector('.modal_overlay ');
const modals = document.querySelectorAll('.modal');

btns.forEach((el) => {
	el.addEventListener('click', (e) => {
		let path = e.currentTarget.getAttribute('data-path');

		modals.forEach((el) => {
			el.classList.remove('modal_visible');
		});

		document.querySelector(`[data-target="${path}"]`).classList.add('modal_visible');
		modalOverlay.classList.add('modal_overlay_visible');
	});
});

modalOverlay.addEventListener('click', (e) => {
	console.log(e.target);

	if (e.target == modalOverlay) {
		modalOverlay.classList.remove('modal_overlay_visible');
		modals.forEach((el) => {
			el.classList.remove('modal_visible');
		});
	}
});

function checkPassword() {
	const password = document.querySelector('input[name=password_reg]');
	const confirm = document.querySelector('input[name=repeat_password_reg]');

	const validator = str => /^[a-zA-Z0-9_]+$/.test(password.value);
	if (!validator(password.value)) {
		password.setCustomValidity('Пароль должен содержать только английские буквы');
	} else {
		if (password.value.length < 6) {
			password.setCustomValidity('Пароль должен содержать не менее 6 символов');
		} else {
			const numberValidator = str => /^\d+$/.test(password.value);
			if (numberValidator(password.value)) {
				password.setCustomValidity('Пароли не должен содержать только цифры');
			} else {
				password.setCustomValidity('');
			}
		}
	}

	if (confirm.value == password.value) {
	  confirm.setCustomValidity('');
	} else {
	  confirm.setCustomValidity('Пароли не совпадают');
	}
}

function checkFile() {
	let file = document.getElementById('poster_review');
	let type = file.files[0].type;
	let err_message = document.getElementById('err_type_file');
	if (type !== "image/jpeg" && type !== "image/png") {
		file.setCustomValidity('Изображение должно быть в формате jpeg/png');
		err_message.innerHTML = "Изображение должно быть в формате jpeg/png";
	} else {
		file.setCustomValidity('');
		err_message.innerHTML = "";
	}
}