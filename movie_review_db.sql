-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 13 2022 г., 15:12
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `movie_review_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id_comment` int NOT NULL,
  `data_comment` date NOT NULL,
  `text_comment` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `id_review` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`id_comment`, `data_comment`, `text_comment`, `user_id`, `id_review`) VALUES
(1, '2022-11-06', 'Полностью согласен с автором, лайк!', 121, 10),
(2, '2022-11-06', 'Хороший отзыв. Качественно все описано.', 115, 10),
(3, '2022-11-06', 'Мне отзыв совсем не понравился. Вы не оговариваете основные моменты из данного фильма, а они очень важные. Если их затронуть в отзыве, то фильм раскрывается совсем по-другому. Я советую пересмотреть данный фильм и понять эти основные моменты.', 116, 10),
(5, '2022-11-06', 'Класс!', 121, 10),
(6, '2022-11-06', 'Отзыв не понравился, мало описано', 121, 10),
(7, '2022-11-06', 'Крутой отзыв. Только я бы поставил все-таки 8 из 10', 121, 13),
(10, '2022-11-06', 'Вау! Действительно круто', 120, 11),
(11, '2022-11-06', 'Диз. Ничего дельного не сказал', 115, 11),
(12, '2022-11-06', 'Согласен с отзывом', 123, 11),
(13, '2022-11-06', 'Крутой отзыв!', 124, 12),
(14, '2022-11-06', 'Крутой отзыв!', 115, 12),
(15, '2022-11-06', 'Класс! Фильму ставлю 7 из 10', 117, 12),
(16, '2022-11-06', 'Класс! Фильму ставлю 5 из 10', 116, 12),
(17, '2022-11-06', 'Отлично!', 118, 13),
(18, '2022-11-06', 'Безупречно!', 115, 13),
(19, '2022-11-06', 'Мало подробностей. Ничего не раскрыто.', 121, 18),
(20, '2022-11-06', 'Мне нравится.', 115, 18),
(21, '2022-11-06', 'Один из лучших отзывов о фильме!', 117, 18),
(23, '2022-11-12', 'Захватывающе!', 114, 11),
(24, '2022-11-12', 'Класс!', 115, 18),
(25, '2022-11-12', 'Мне не понравился. Увы, но видел и лучше', 132, 13),
(27, '2022-11-13', 'Абракадабра', 114, 18),
(28, '2022-11-13', 'Сюжет не очень', 114, 11);

-- --------------------------------------------------------

--
-- Структура таблицы `review`
--

CREATE TABLE `review` (
  `id_review` int NOT NULL,
  `title_review` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description_review` varchar(340) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `poster_review` varchar(255) NOT NULL,
  `video_review` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date_review` date NOT NULL,
  `text_review` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_user` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `review`
--

INSERT INTO `review` (`id_review`, `title_review`, `description_review`, `poster_review`, `video_review`, `date_review`, `text_review`, `id_user`) VALUES
(10, 'Вертикальный предел (2000)', 'Группа альпинистов оказалась погребенной заживо в расщелине у вершины К-2, второй после Эвереста горы мира. На такой высоте им оставалось жить считанные часы.\r\nШестеро отчаянных смельчаков решают подняться на роковую отметку, чтобы вызволить их из ледяной могилы.', 'f47b9c0354d2e62428113af95f08efb4.jpg', 'https://www.youtube.com/embed/aqli-psym5c', '2022-11-05', 'История о том, что может произойти с любителями острых ощущений, когда жажда адреналина и чрезмерная самоуверенность может сыграть над вами злую шутку.\r\nСюжет – интересно, страшно, захватывающе. Каждую секунды ты переживаешь новые ощущения вместе с героями фильма, и если меня спросят, о ком или о чем эта картина, то я отвечу – о риске, которому ты подвергаешь себя, имея дело с горами. Я не могу выделить здесь никого, кроме гор. На фоне этих удивительных творений природы, актеры и их герои просто теряются.\r\nРежиссеру - Мартину Кэмпбеллу удалось показать горы с совершенно иной стороны. Кажется, что они слышат и им очень не нравится, когда тревожат их покой. Подтверждением моих слов является такое нередкое явления, как лавины, которые сметают и хоронят под собой все, что не успело спастись.\r\nХоть раз в жизни, но этот фильм стоит посмотреть!\r\n9 из 10', 114),
(11, 'Матрица (1999)', 'Жизнь Томаса Андерсона разделена на две части: днём он — самый обычный офисный работник, получающий нагоняи от начальства, а ночью превращается в хакера по имени Нео, и нет места в сети, куда он бы не смог проникнуть. Но однажды всё меняется. Томас узнаёт ужасающую правду о реальности.', 'c1caeb11fcbbd914bc9408e12be41d99.jpg', 'https://www.youtube.com/embed/YihPA42fdQ8', '2022-11-05', 'За два с половиной часа Вачевски вынесли мозг миллионам людей, безжалостно переворачивая с ног на голову всё, к чему мы привыкли. Вачовски, тогда никому неизвестные, сломали стереотипы, объединив науку, философию, фантастику и боевик в одном многослойном сюжете, образуя вместе ядреный коктейль. Матрица стерла в порошок все представления о фантастических боевиках, содрогнула мир кинематографа и сдвинула на второй план, вышедшие тогда звездные войны.\r\n\r\nКак ни крути, но фильм шедевр и задрал планку очень высоко, фильм заставил многих восхищаться не только качественно поставленными драками, сюжетом и стильными плащами, но и задуматься о смысле человеческого бытия.\r\n\r\nФильм, изменил мировоззрение миллионов людей по всему свету и произвел в мире настоящий фурор. Кассовые сборы в пять раз превысили бюджет картины и затраты на маркетинг, «Матрица» получила четыре Оскара и 28 премий.\r\n\r\nОсобенность матрицы в том, что Вачовски при её создании взяли всё самое лучшее, из фильмов про иллюзорность мира и соединили эти элементы в свой необычный фильм. Создатели хотели не просто заработать деньги, они творили великое произведение искусства.\r\n\r\nС точки зрения философии фильм получился очень сытным, и как-будто говорит с нами на одном языке и не важно какой религии и философии мы придерживаешься. Это изысканное блюдо из арт-хауса, кибер-панка, фантастики и боевика, приправленное уникальными спецэффектами и крышесносящей музыкой. Философская притча, спасение мира от диктатуры. Победа над искусственным разумом. Стремление к лучшему. Все это о Матрице.\r\n\r\nЛюбой зритель найдет что-то важное и интересное для себя в фильме. Лента удовлетворяет потребности любого зрителя: тех кто любит драки и когда все взрывается, и тех кто любит вслушиваться в диалоги, искать детали и намеки, которых в фильмы достаточно. Каждое слово, фраза и диалог вызывают восхищение. Фильм многогранный и доставляет массу удовольствия тем, кто любит зрелищное кино и тем кто любит умное кино.\r\n\r\nМатрицу нельзя понять с первого раза, ибо смысл и количество идей, заложенных в ней, не переварить за раз с попкорном. Проходят десятилетия, а мы продолжаем находить в фильме что-то новое и задумываться о смысле человеческого бытия.\r\n\r\nМы пересматриваем фильм снова и снова, еще и потому что он снят идеально, нет ничего лишнего, что отвлекало бы внимание от сюжета, каждый кадр несет в себе глубокий смысл. Изюминка сюжета еще и в том, что мы погружаемся в него постепенно. Сюжет открывает нам информацию о Матрице, об Избранном, о сопротивлении, о настоящем реальном мире не сразу, а по чуть-чуть.\r\n\r\nВ этом фильме присутствует какая-то магия в визуальном и звуковом плане, которая до сих пор отличает этот фильм от современных и навороченных блокбастеров.\r\n\r\nВряд ли на планете остались люди, которые еще не видели этот культовый фильм. Такие шедевры не забывают и смотрят по многу раз от малого ребенка до взрослого человека, переставая моргать.\r\n\r\nВ детстве, сердце начинало биться чаще при мысли о фильме, и веришь что наши тела порабощены. А когда становишься старше, понимаешь, что в плену не тела, а наше сознание.\r\n\r\nМатрица породила массу фильмов подражателей, которые всегда будут вторыми. После матрицы в индистрии кино поменялось практически все и фильм стал переломной вехой.\r\n\r\nВсе иллюзия\r\nКартина открывает зрителю новый Мир, где реальность – иллюзия, а невозможное – возможно. Мир, где человек способен раскрыть свой потенциал настолько, что даже представить себе не мог. Фильм словно открывает двери сознания.\r\n\r\nМысль о том, что в каждом человеке скрыт огромный потенциал, а его реализация зависит лишь от веры в собственные силы, поистине вдохновляет, а идея иллюзорности Мира заставляет задуматься, да и как можно утверждать, что окружающий нас мир реален, если мы так мало о нём знаем?\r\n\r\nВ картине затронута тема судьбы. Человек как белка в колесе живет с рождения в иллюзии, по предсказуемой и одинаковой траектории. Рождение, садик, школа, институт, семья, карьера, смерть. Некая программа, по которой все живут. И каждый кто подключен к системе — ее потенциальный агент.\r\n\r\nЛюди находятся под влиянием системы и живут под ее диктовку, живут во сне и верят во все, что им показывают. Весь привычный мир это всего лишь картинка, натянутая на глаза. Всё, что мы видим, ощущаем и чувствуем, это всего лишь электрические сигналы, которые посылают в наш мозг машины. Разум людей порабощен, а они даже не подозревают об этом. В этом мире людям комфортно и уютно. За них думают, им говорят во что одеваться, что слушать и кому верить, и никто из них не против.\r\n\r\nФильм советует «Проснуться» — увидеть иллюзию со стороны, а потом освободить ум и встретиться с самим собой. Чтобы освободиться от системы, Нео следует начать вести себя нестандартно, и делать то, чего он никогда раньше не делал и сам от себя не ожидал.\r\n\r\nМатрица доносит до зрителя сильные мысли и оказывает мощное воздействие на сознание. Матрица помогает нам заглянуть по ту сторону реальности. В фильме звучит протест и призыв раздвинуть узкие рамки повседневности и взлянуть на мир шире…\r\n\r\nКто-то даже уловил в сцене разговора с архитектором, что реальный мир и Зеон это тоже иллюзия, матрица внутри матрицы, объясняя этим сверхспособности Нео вне матрицы. А кто-то вообще считает что избранный вовсе не Нео, а агент Смит.\r\n\r\nФильм рассказывает нам об огромном значении выбора, это можно чётко проследить в эпизоде, когда Морфеус предлагает Нео выбрать одну из таблеток. Сразу начинаешь думать, а что бы ты выбрал на его месте: спокойную привычную и зажиточную жизнь или тяжёлую правду. Кстати Вачовски в интервью сказали что сами выбрали бы голубую таблетку и предпочли бы остаться в сладком мире грез.\r\n\r\nМашины лишают человека реальности, давая взамен более лучшую жизнь, чем на развалинах старого мира. А надо ли человеку всё это? Богатство, признание, успех, нежный вкус дорогой рыбы или пьянящий аромат красного вина – может быть иллюзия лучше реальности? Эту идею создатели пытаются пронести через поступок Сайфера.\r\n\r\nРазумеется, в центре всего стоит персона Избранного; он, наслушавшись предсказаний Пифии должен выбрать свой путь. Он не хочет подчиняться судьбе, даже если она имеет место быть в нашем мире. Все эти предсказания и прочее говорят только о возможных вариантах развития событий, и будущее зависит только от нас, а вернее от наших поступков и выбора.\r\n\r\nС помощью силы человеческой любви, целеустремленности и веры человек может преодолеть любые преграды на своём пути и творить чудеса.\r\n\r\nПоследние мысли\r\nВозможно и наш мир, в какой-то степени, подобная проекция матрицы. В нашем мире есть множество супер-программ, например ДНК - один из совершеннейших компьютеров на клеточном уровне. Это алфавит и код, составляющие 6 миллиардов битов, формирующих человека. Клетки человека как узлы, кодируют и декодируют информацию.\r\n\r\nИ в природе такие примеры повсюду, когда материя преобразуется по сложнейшим и независимым алгоритмам. Вся Вселенная как один большой суперкомпьютер. И при этом мы не наблюдаем программиста. Существует ли он? Если нет, то как такое случайно само возникло из хаоса? Мы подобно первобытному человеку, стоим трансформатора и не может понять его смысл и назначение.\r\n\r\nИ кто знает, не находимся ли мы сейчас в Матрице, переживая заложенные программой сны, словно свою собственную жизнь…\r\n\r\nЯ верю Нео и Морфеусу, верю в то, что все мы живем в Матрице, и в то, что кому-то нужна наша энергия, хотя не видел этого собственными глазами. Но где-то в глубине души у меня теплится надежда, что когда-нибудь Морфеус найдет и меня. И откроется мне истина, что возможно, мы верим совсем не в то, а то, во что верим и нет вовсе.\r\n\r\nКогда Пифия пекла печенье, я будто чувствовал их ароматный сладкий запах. Хотелось их попробовать, чтобы мне тоже стало легче...', 119),
(12, 'Мстители (2012)', 'Локи, сводный брат Тора, возвращается, и в этот раз он не один. Земля оказывается на грани порабощения, и только лучшие из лучших могут спасти человечество. Глава международной организации Щ.И.Т. Ник Фьюри собирает выдающихся поборников справедливости и добра, чтобы отразить атаку.', 'f860cfdac5d02190488dcf34f71a931c.jpg', 'https://www.youtube.com/embed/5iw-hJ6xteE', '2022-11-05', '«Любой ценой!» - прекрасный слоган, который Марвел взяли для своего самого масштабного творения – «Avengers: Endgame» (или как было локализовано в нашем переводе «Мстители: Финал»).\r\n\r\nА ведь действительно, фраза «любой ценой» стала означать для нас очень много. Любой ценой досидеть до конца сеанса (180 минут), любой ценой не попасть на спойлеры (как мы все знаем, пред показ в Саудовской Аравии прошел за неделю до мирового и «бедные» дети шейхов, просто начали выкладывать видео, снятые с их смартфонов в youtube и Instagram), любой ценой забить на огромные ляпы и противоречия в данной ленте и просто насладиться одним из самых величайших блокбастеров нашего столетия.\r\n\r\nНа этот раз, братья Руссо почти удержали интригу к картине, рассказав нам, что в 90% промо трейлеров используются только первые 30 минут фильма… Всё бы ничего, если бы не пару огромных «НО». Первое, на что хотелось обратить внимание – скорость развития самой истории фильма. А теперь вспоминаем фразу «первые 30 минут» и трейлеры к фильму. На выходе получаем сочную солянку, в которой за эти несчастные 30 минут нам показали, что с лучилось с персонажами после щелчка Таноса, как они собрали команду Мстителей на поиски этого «баклажана», постапокалиптический пустой мир, который до сих пор не может прийти в себя от того, что произошло, момент воссоединения Старка и Кэпа (ну и Пеппер где-то там), тренировку старшей дочери Клинта Бартона с дальнейшим развитием второго в персонажа Ронина, возвращение Муравья из квантового мира и разработка новых костюмов для путешествий …\r\n\r\nЧувствуете это? Да? Это горит абсолютно всё… всё что можно. Поскольку на очень сжатое начало фильма, взвалили огромный кусок истории. Меня до сих пор не покидает мысль о том, что эти тридцать минут были по типу – «в предыдущих сериях было…»\r\n\r\nПосле «небольшого» разогрева со стороны Марвел, мы переходим к более спокойному просмотру в стиле «Гражданской войны», поскольку по большей мере, история будет развиваться на диалогах и взаимоотношении между персонажами. Да, в данной ленте не будет чрезмерного экшена и битв через каждые 10-15 минут фильма, они все остались в предыдущей части.\r\n\r\nГрафика в данной ленте порадовала — это действительно сочная картинка, где CGI доведена до её апогея (на момент сьёмок в 2017-2018 годах). Это вам не костюм Тони с гражданской войны (где явно было видно, как нелепо была «пришита» голова Роберта к CGI картинке костюма нового MARK) и не мультяшный MARK 50 с Войны Бесконечности. В Endgame вложились очень и очень сильно. Оно и не удивительно, поскольку бюджет данного творения составил 356.000.000$, а кассовые сборы за первый уикенд получились феноменальными - 1.022.000.000$.\r\n\r\nК слову, о съёмках. Фильм снимался параллельно предыдущей части, и сами актеры иногда выдавали спойлеры, которые относились не к той части фильма.\r\n\r\nКасаемо сценария – его никто не знал полностью, кроме одного единственного человека ( я имею ввиду про актеров) и им был Роберт Дауни Мл. Да, только этот актер имел доступ к 100% сценария. Что касаемо остальных, там история была довольно интересная. Марк Руффало (Халк) снимался вообще в 5 разных концовках, что бы в случае спойлера в 80% он не попал бы на ту самую концовку. Том Холланд (человек – спойлер) вообще снимался без людей. Ему говорили, что нужно было делать, а потом отснятый материал прикрепляли к основной части.\r\n\r\nПересъёмки и до съёмки продолжались вплоть до середины марта 2019 года.\r\n\r\nМузыкальное сопровождение в фильме не навязчивое. Я бы даже сказал – незаметное. Но наверно это и к лучшему, поскольку мне хотелось весь фильм сопереживать героям и быть полностью погруженным в эпичность происходящего, а не слушать треки Eminem и Kendrick Lamar. Ничего против данных исполнителей не имею и их композиции к Черной Пантере и Веному были великолепны, но сейчас мы не об этом.\r\n\r\nГоворя о самом сценарии, было видно много ляпов и погрешностей. Но что я хочу сказать … Мы их заметили уже после того, как вышли из кинозала и начали размышлять о том, какой сногсшибательный фильм мы увидели. Понимаете о чем я ? Братьям Руссо получилось так заворожить зрителя магией Марвел, что данные ляпы увидят только те, которые знаю КВМ уж очень хорошо, да и то – не сразу. Энтони и Джо проделали невероятную работу и воплотили все наши детские мечты в невероятной линейке из 22 фильмов ( а в июне, нас ожидает дополнение к ним и последний фильм третьей фазы КВМ «Человек-Паук: Вдали от дома»).\r\n\r\nБыли конечно и моменты с некоторыми персонажами, когда хотелось просто кричать от того, что они с ним сделали, но потом понимаешь, что так нужно было и что это ещё не конец его приключений (привет Тор 4 в 2022 году ! К слову – Тор станет единственным, у кого будет четвертый сольный фильм).\r\n\r\nКасаемо названия в нашей локализации «Финал» - он все же пришел для некоторых персонажей Марвел. Как бы мы не хотели что бы они продолжали нас радовать своими ролями на большом экране кинокомиксов, но время пришло… Хочу сказать только одно – их «финал» был очень красиво продуман и ни одного из персонажей не «слили», а дали достойно уйти на пенсию (у меня только один вопрос - почем они не убили Бри Ларсон ? :D ).\r\n\r\nНемного затронем финальную битву. Это было великолепно. Я бы даже сказал – шедеврально. Это действительно финал пути, в котором было покончено не только с «Сагой Бесконечности» но и с прошлым. Впереди только новое будущее. Будущее, которое будет прописано с чистого листа.\r\n\r\nПодводя итоги, мне не хочется обсуждать негативные моменты и чрезмерный хайп, который присутствовал в период мировой премьеры и до премьерных показов. Коротко, ясно и без всяких объяснений – 9.1/10. Это одна из самых лучших оценок, которые я когда-либо ставил кинолентам.\r\n\r\nМарвел, спасибо вам за эти 11 прекрасных лет ! Надеюсь, вы и дальше будете радовать нас своими крутыми творениями.', 122),
(13, 'Аквамен (2018)', 'Действие фильма разворачивается в необъятном и захватывающем подводном мире семи морей, а сюжет знакомит зрителей с историей происхождения получеловека-полуатланта Артура Карри и ключевыми событиями его жизни – теми, что заставят его не только столкнуться с самим собой, но и выяснить, достоин ли он быть тем, кем ему суждено… царем!', '8eeb1cdcf5e10927d50c418b044a6147.jpg', 'https://www.youtube.com/embed/fVDfuFL-QnY', '2022-11-05', 'В середине 1980-х смотритель маяка (Темуэра Моррисон) вылавливает из воды раненую блондинку в чешуйчатом костюме, выгодно подчеркивающем грудь (Николь Кидман). Выясняется, что она королева подводного царства Атлантида в бегах от мужа. Смотритель и королева любят друг друга, и у них появляется сын Артур, но за беглянкой приходит океанский спецназ, и однажды она ради всеобщего блага добровольно возвращается в пучину.\r\n\r\nВ наши дни Артур (Джейсон Момоа), длинноволосый татуированный качок с веселым взглядом и острыми бровями, живет с отцом (которого он в русском переводе величает батей) и известен прессе и в местном баре как Аквамен, самый бессмысленный член «Лиги справедливости». Спасая как-то русскую подлодку, он обзаводится заклятым врагом — потомственным пиратом (Яхья Абдул-Матин II). Но вскоре у него появляются более серьезные проблемы: как сообщает ему вышедшая из волны красноволосая принцесса (Эмбер Херд), ее жених, а его сводный брат Орм (Патрик Уилсон), нынешний правитель Атлантиды, собирается объединить все подводные царства и пойти войной на обитателей суши. А значит, Артуру нужно срочно сместить брата и занять трон владыки морского.\r\n\r\nЗа два с лишним часа фильм регулярно позволяет зрителю слегка отвлечься и задуматься, и, скорее всего, вы много будете думать о возрасте и о волосах. О волосах — долго объяснять, но они у всех персонажей примечательные и интересно (при этом по-разному) ведут себя под водой. Что касается возраста, то уже в прологе эта тема возникает в связи с компьютерно обработанной Николь Кидман, которая пару минут выглядит и ведет себя как Дэрил Ханна в фильме «Всплеск», что в данном случае и смешно, и немного страшно. Сорокалетний Момоа изображает примерно тридцатилетнего героя, 45-летний Патрик Уилсон, выбеленный и разглаженный до какого-то эльфийского состояния, — его младшего брата. Наконец, во флешбэках пара-тройка весьма насыщенных десятилетий стерта с лица Уиллема Дефо, который играет тут советника Орма и одновременно гуру Аквамена, своего рода Йоду — вот уж, к слову, кто не боялся выглядеть на свои девятьсот.\r\n\r\nОбучение им Артура скоростному плаванию и кунг-фу на трезубцах, впрочем, укладывается в какие-то несколько минут — Аквамен» не из тех супергеройских фильмов, где спаситель человечества половину времени жует сопли, размышляя о своем предназначении или оттачивая свалившийся на него дар. «Аквамен» — это скорее «Черная пантера» (и отчасти «Тор»), только с обратным распределением ролей: герой претендует на престол в волшебной стране и вызывает на поединок действующего монарха, своего близкого родственника, который обижен на весь мир и хочет с ним воевать.\r\n\r\nНо если в «Пантере» вся эта сказочная геополитика напрямую резонировала с реальной планетой Земля и ее реальными проблемами, здесь ничего подобного нет, и следить за дворцовыми интригами и военными планами Атлантиды скучновато. Артур сразу говорит — точнее, мычит, как он обычно делает, — что никаким царем быть не хочет, но ясно, что уговорить его будет не сложно. Возникает тема «чистокровных» и «полукровок» — поскольку Аквамен наполовину магл, — но очень схематично. То же самое касается экологического вопроса, который этому фильму вроде бы доктор прописал; более того, о загрязнении океанов вспоминают в основном злодеи.\r\n\r\nДругое дело, что «Аквамен» и не притворяется высказыванием, что по нынешним временам свежо и скорее мило. Его задача — с ветерком прокатить нас на морском коньке, и он чаще с ней справляется, чем нет. Эмбер Херд для мальчиков (и девочек), Джейсон Момоа для девочек (и мальчиков), Патрик Уилсон ни для кого, грандиозные декорации, тупейшие диалоги, бодрый темп. В середине фильм превращается в легкий поп-культурный квест в стиле Дэна Брауна — тайные знаки, римские статуи, роковой трезубец, который может вытащить только герой по имени Артур — потом дает немного Гильермо дель Торо, а к концу и вовсе «Властелина колец». Режиссер Джеймс Ван не зря оттачивал свое чувство юмора на франшизе «Пила»: не будем раскрывать, кого тут (лишь в оригинале, естественно) озвучивает Джули Эндрюс, актриса из «Звуков музыки» и «Мэри Поппинс» 1964 года, но, скажем так, томик Лавкрафта в прологе мелькает не случайно.\r\n\r\nЕсли «Аквамен» нам что-то и сообщает, то, наверное, что психоделическая революция была не зря: можно потратить двести миллионов на фильм, в котором армия акул бьется с армией крабов, отрицательный герой передвигается, кажется, на крокодиле и иногда появляется Дольф Лундгрен в аквамариновых доспехах. Умение общаться с рыбами — не самая желанная сверхспособность, поскольку говорить с ними особо не о чем, но кто откажется от хорошего купания.', 122),
(18, 'Аватар (2009)', 'Бывший морпех Джейк Салли прикован к инвалидному креслу. Несмотря на немощное тело, Джейк в душе по-прежнему остается воином. Он получает задание совершить путешествие в несколько световых лет к базе землян на планете Пандора, где корпорации добывают редкий минерал, имеющий огромное значение для выхода Земли из энергетического кризиса.', 'eb6b7c71784bc9a079eca66745ea033e.jpg', 'https://www.youtube.com/embed/4HFlPcX2HFo', '2022-11-06', 'Превращение Джеймса Кэмерона из человека, который брал у знакомых деньги в долг на съемки, в одного из самых влиятельных режиссеров современности произошло с молниеносной быстротой, свойственной только действительно одержимым своим делом людям. Он не стоял на месте, всегда хотел немного большего, чем остальные, и неизменно нас удивлял. Но после феноменального успеха «Титаника» Кэмерон удивил всех по-настоящему – больше чем на 10 лет пропал где-то в морских глубинах.\r\n\r\nПотом он повел себя еще невероятней - начал снимать неизвестного австралийского актера Уортингтона в декорациях, состоящих из одних зеленых экранов. В прессе о его новом проекте писали будоражащие словосочетания: &#39;техническая революция&#39;, &#39;500 миллионов&#39;, &#39;3D&#39; и &#39;старческий маразм&#39;. Пока скептики плодились, словно грибы после дождя, тысячи кинотеатров по всему миру тратили страшные деньги на переоборудование, чтобы показать «Аватар» таким, каким его задумал режиссер. Это явление само по себе делает очевидным пугающий факт. Кэмерон – не один из влиятельнейших деятелей Голливуда, он – самый влиятельный, он просто взял и за несколько лет подмял существующий рынок под себя.\r\n\r\nНе так давно Роберт Земекис решил немного побурчать о замеченной им несправедливости. И чего, мол, все так носятся с этим «Аватаром»? Ведь он, Земекис, уже целых три фильма успел сделать по этой технологии! Кино никогда не являлось той областью, где количество было важнее качества. «Аватар» эту аксиому подтверждает с самых первых кадров, и на протяжении трех часов экранного времени пропасть между достижениями Кэмерона и достижениями других режиссеров становится только шире и глубже. Пока его коллеги пытались кое-как разобраться со строительством куличиков из песка, Джеймс уже сел за руль экскаватора и нанял бригаду рабочих.\r\n\r\nПланета Пандора без каких-либо скидок – величайшая декорация в истории кино. Ничего более масштабного, проработанного, визуально совершенного не делал никто и никогда. Пока неуклюжий протагонист прогуливается по джунглям, на экране успевают появиться тысячи видов растений, сотни видов животных – придуманных, каталогизированных и научно обоснованных специально для «Аватара». Поверить в то, что этот мир, в котором шестиногие лошади вполне убедительно уживаются с парящими в небе скалами, дело человеческих рук почти невозможно – Пандора осязаема, реальна.\r\n\r\nБытность народа На’Ви, которой посвящена почти вся первая половина фильма, ошеломляет не меньше планеты, на которой они живут. Понятное дело, что их философия «сохранения баланса лицевого счета с природой» взята прямиком у коренных жителей Америки, разве что гармония с окружающим миром возведена в абсолют. Однако обрамляющая этот мировоззренческий скелет культура проработана с не меньшей маниакальностью, чем все остальное в «Аватаре»: собственный язык, собственная религия, собственные легенды, уникальная музыка и неразрывно со всем этим связанная собственная физиология.\r\n\r\nНо даже четверть этого великолепия не могла бы быть реализована без технологического прорыва. И он был совершен в стенах The Volume – самой передовой съемочной площадки в мире. «Аватар» - никакой не мультфильм, хоть и состоит больше чем на половину из компьютерной графики. Это кино, где одетые в CG актеры играют малейшими мимическими мышцами лица, пускают настоящие слезы и выглядят настолько реально, насколько вообще могут трехметровые синие люди. А вокруг них густые фотореалистичные джунгли, в которых каждая травинка прорисована вручную. За каждым кадром «Аватара» кроется титанический труд художников и добрая сотня часов работы одного из самых мощных компьютеров в мире, и этих кадров накопилось на три часа экранного времени. Это не просто кино – это личный потолок Сикстинской капеллы для Кэмерона, и серьезнейшей испытание на прочность за всю историю студии WETA.\r\n\r\nВпрочем, в качестве формы картины сомневались только те, кто не был на «Дне Аватара» (устроенном специально, чтобы в эту великую, как казалось, авантюру поверили), а вот за содержание и правда можно было поволноваться. Кэмерон не особо скрывал, что его новая работа – смесь «Танцев с волками», «Лоуренса Аравийского» и «Покахонтас». Да, «Аватар» именно об этом – о любви. О любви, для которой нет преград, которая сметает толстые стены расовых предрассудков, культурных отличий, непостижимых расстояний и не угасает даже перед лицом страшной войны и смерти. Кэмерон молчал аж с 1997 года, и ему можно простить желание высказаться на темы, которые последние десять лет мусолились всеми остальными. Между строк «Аватара» читается решительное «нет» расизму, глобализации, иракской войне и экологической расхлябанности человечества. Вопросы, прямо скажем, не поражающие своей новизной, но так и не потерявшие своей актуальности.\r\n\r\nВ остальном «Аватар» - это концентрированный, вылизанный до блеска, преподнесенный в своей самой притягательной форме – Голливуд. Не бойтесь клише, сказал однажды Джордж Лукас, они стали клише только потому, что они работают. Штампы, как и любой другой инструмент, работают именно так как нужно только в руках профессионала с горящими глазами. И если их брать грязными руками и тыкать зрителю в лицо со словами «На, жри», как это делают многие современные творцы от мира кино, это вызовет лишь отторжение. Кэмерон выносит штампы на блюдечке с голубой каемочкой и сопровождает их таким количеством новых деталей, что давно забытое старое в его интерпретации порой не отличить от нового.\r\n\r\n«Аватар» для всех, кто живет и дышит миром кино, многие годы оставался этаким священным Граалем, достижения которого можно было одновременно страшиться и ждать изо всех сил. Один из главных режиссеров современности решил перенести свои детские фантазии на большой экран, вооружившись технологией настолько передовой, что ему пришлось самостоятельно разрабатывать ее практически с нуля. Многолетнее ожидание Кэмерона окупилось сполна – он получил в свои руки инструмент, способный сделать режиссерские возможности воистину безграничными, он добился, наконец, почти полного отсутствия посредничества между творцом и его фильмом. Это достижение выглядит особенно ярким на фоне «эры продюсеров», воцарившейся сейчас в мире кино. Чтобы ни под кого не прогибаться Спилберг нашел себе инвесторов, страшно сказать, в Индии. Кэмерон выбрал себе куда более тернистый способ оставаться главным на площадке – и не прогадал.\r\n\r\nСамым опасным врагом создателя «Аватара» была возможность оказаться заложником собственных амбиций, не оправдать ожиданий и, простите, заиграться со спецэффектами, как это случилось с Джорджем Лукасом. Кэмерон, слава богу, легко избежал каждой из этих плачевных участей. Технология «Аватара» настолько великолепна, что его содержание, сколь бы углубленным оно не было, все равно бы слегка проигрывало на фоне формы, поэтому изо всех зол было разумно выбрать меньшее – сделать кино простым, эмоциональным и воздушным.\r\n\r\n«Аватар» именно такой. Он не похож на вымученный многолетний труд стареющего гения, он похож на прогулку, в которую ваши дети будут брать своих детей, он похож на великое кино, о существовании которого все, кажется, уже давно забыли.', 114);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `name_user` varchar(255) NOT NULL,
  `email_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password_user` varchar(255) NOT NULL,
  `role_user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id_user`, `name_user`, `email_user`, `password_user`, `role_user`) VALUES
(114, 'Никита Никифоров', 'nikita_nikifrov@mail.ru', '6cc12323fe7cb891558199c26477149b', 'Модератор'),
(115, 'Ксения Николаева', 'ksenia4341@mail.ru', '6cc12323fe7cb891558199c26477149b', 'Пользователь'),
(116, 'Тихон Петухов', 'pet_tixon0999@gmail.ru', '6cc12323fe7cb891558199c26477149b', 'Пользователь'),
(117, 'Сергей Громов', 'sergey_grom_098@gmail.ru', '6cc12323fe7cb891558199c26477149b', 'Пользователь'),
(118, 'Ольга Иванова', 'olha_ivanova_111@yandex.ru', '6cc12323fe7cb891558199c26477149b', 'Пользователь'),
(119, 'Филипп Кузнецов', 'kyznec_filip_09123@yandex.ru', '6cc12323fe7cb891558199c26477149b', 'Модератор'),
(120, 'Ярослава Муравьева', 'myr_yar_pro_1222@rambler.ru', '6cc12323fe7cb891558199c26477149b', 'Пользователь'),
(121, 'Александр Белов', 'beliy_alex_111@yahoo.com', '6cc12323fe7cb891558199c26477149b', 'Пользователь'),
(122, 'Антон Моисеев', 'moisey09123@yahoo.com', '6cc12323fe7cb891558199c26477149b', 'Модератор'),
(123, 'Роберт Иванов', 'robert_ivanov_000@mail.ru', '6cc12323fe7cb891558199c26477149b', 'Пользователь'),
(124, 'Павел Сузарев', 'pavel123@mail.ru', '6cc12323fe7cb891558199c26477149b', 'Пользователь'),
(132, 'Олег Киров', 'oleg_kirov@mail.ru', '6cc12323fe7cb891558199c26477149b', 'Пользователь'),
(133, 'Абу-Хазми Кваков', 'Hazmi0999@mail.ru', '5d9e2fc0228c81342f4b983e1d922cec', 'Пользователь');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `id_review` (`id_review`);

--
-- Индексы таблицы `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id_review`),
  ADD KEY `id_user` (`id_user`) USING BTREE;

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id_comment` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `review`
--
ALTER TABLE `review`
  MODIFY `id_review` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`id_review`) REFERENCES `review` (`id_review`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
