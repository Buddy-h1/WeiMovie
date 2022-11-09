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