/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: quizdb
-- ------------------------------------------------------
-- Server version	10.11.14-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `words`
--

DROP TABLE IF EXISTS `words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `word` varchar(100) DEFAULT NULL,
  `meaning` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `synonym` varchar(255) DEFAULT NULL,
  `antonym` varchar(255) DEFAULT NULL,
  `example` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `words`
--

LOCK TABLES `words` WRITE;
/*!40000 ALTER TABLE `words` DISABLE KEYS */;
INSERT INTO `words` VALUES
(1,1,'appliance','가전제품','device','furniture','The appliance is energy efficient.\r'),
(2,1,'electricity','전기','power','blackout','The house uses solar electricity.\r'),
(3,1,'bill','요금','charge','refund','I paid the bill yesterday.\r'),
(4,1,'plumber','배관공','technician','amateur','The plumber fixed the leak.\r'),
(5,1,'repair','수리하다','fix','damage','He will repair the sink.\r'),
(6,1,'leak','새다','drip','seal','Water began to leak from the pipe.\r'),
(7,1,'install','설치하다','set up','remove','They will install a new system.\r'),
(8,1,'broken','고장난','damaged','fixed','The TV is broken.\r'),
(9,1,'replace','교체하다','substitute','keep','We need to replace the filter.\r'),
(10,1,'maintenance','유지보수','upkeep','neglect','Regular maintenance is important.\r'),
(11,1,'electricity bill','전기요금','utility fee','credit','The electricity bill increased.\r'),
(12,1,'pipe','파이프','tube','block','The pipe burst suddenly.\r'),
(13,1,'fix','고치다','repair','break','He can fix anything.\r'),
(14,1,'damage','손상','harm','repair','The storm caused serious damage.\r'),
(15,1,'service','서비스','assistance','neglect','The repair service was quick.\r'),
(16,1,'traffic','교통','transportation','stillness','Traffic was heavy this morning.\r'),
(17,1,'commute','통근하다','travel','stay','She commutes by bus.\r'),
(18,1,'delay','지연','postpone','accelerate','The train faced a delay.\r'),
(19,1,'route','경로','path','obstacle','This is the fastest route.\r'),
(20,1,'vehicle','차량','car','pedestrian','The vehicle stopped suddenly.\r'),
(21,1,'passenger','승객','traveler','driver','The passenger got off.\r'),
(22,1,'fare','요금','fee','discount','The bus fare is cheap.\r'),
(23,1,'station','역','terminal','origin','Meet me at the station.\r'),
(24,1,'platform','승강장','stage','underground','The train arrived at the platform.\r'),
(25,1,'ticket','표','pass','penalty','I bought a ticket.\r'),
(26,1,'schedule','일정','timetable','chaos','Check the train schedule.\r'),
(27,1,'arrive','도착하다','reach','depart','The train will arrive soon.\r'),
(28,1,'depart','출발하다','leave','arrive','The plane will depart at noon.\r'),
(29,1,'luggage','짐','baggage','emptiness','She carried heavy luggage.\r'),
(30,1,'destination','목적지','goal','origin','Paris is my destination.\r'),
(31,1,'cleaning','청소','washing','dirtying','The cleaning is done.\r'),
(32,1,'laundry','세탁','washing','staining','I did the laundry.\r'),
(33,1,'vacuum','청소기','cleaner','mess','Use the vacuum daily.\r'),
(34,1,'dust','먼지','dirt','cleanliness','The table had dust.\r'),
(35,1,'tidy','정리하다','organize','mess up','Please tidy your room.\r'),
(36,1,'chore','집안일','task','leisure','Washing dishes is a chore.\r'),
(37,1,'grocery','식료품','food','waste','Buy groceries today.\r'),
(38,1,'cook','요리하다','prepare','order','I will cook dinner.\r'),
(39,1,'recipe','요리법','formula','guess','This recipe is easy.\r'),
(40,1,'ingredient','재료','component','finished product','Add fresh ingredients.\r'),
(41,1,'meal','식사','food','fasting','We had a big meal.\r'),
(42,1,'clean','깨끗한','neat','dirty','The room is clean.\r'),
(43,1,'messy','어수선한','untidy','neat','His desk is messy.\r'),
(44,1,'organize','정리하다','arrange','scatter','She will organize files.\r'),
(45,1,'store','보관하다','keep','discard','We store food here.\r'),
(46,1,'trash','쓰레기','garbage','treasure','Take out the trash.\r'),
(47,1,'recycle','재활용하다','reuse','waste','We should recycle plastic.\r'),
(48,1,'sweep','쓸다','brush','dirty','She will sweep the floor.\r'),
(49,1,'mop','걸레질하다','wipe','stain','He mopped the kitchen.\r'),
(50,1,'wash','씻다','clean','soil','Please wash your hands.\r'),
(51,1,'agenda','안건','schedule','deviation','The seminar agenda has been e-mailed to all attendees.\r'),
(52,1,'finalize','완성하다','complete','start','We finalized the list of speakers for the convention.\r'),
(53,1,'postpone','연기하다','delay','advance','The meeting was postponed until tomorrow at 3 P.M.\r'),
(54,1,'short notice','촉박한 통보','sudden','ample','The conference call was canceled on short notice.\r'),
(55,1,'candidate','지원자','applicant','employer','The human resources manager will review each candidate\'s résumé.\r'),
(56,1,'colleague','동료','coworker','stranger','One of my colleagues asked me to make the materials.\r'),
(57,1,'evaluate','평가하다','assess','ignore','Managers must evaluate their employees twice a year.\r'),
(58,1,'relocate','전근하다','move','stay','Ms. Johnson will relocate to the Houston branch next month.\r'),
(59,1,'temporary','임시의','provisional','permanent','Several temporary workers have been hired for the holidays.\r'),
(60,1,'assemble','조립하다','construct','dismantle','The delivery person will assemble the desk you ordered.\r'),
(61,1,'capacity','수용량','volume','emptiness','The capacity of the warehouse needs to be increased.\r'),
(62,1,'launch','출시하다','release','withdraw','Royal Bank launched an online investment service.\r'),
(63,1,'revenue','수익','profit','loss','Morris Industries reported a significant increase in revenue.\r'),
(64,1,'attract','끌다','entice','repel','The advertisement has attracted a lot of attention.\r'),
(65,1,'complimentary','무료의','free','charged','All purchases qualify for a complimentary bottle of wine.\r'),
(66,1,'demonstrate','시연하다','display','conceal','The sales assistant demonstrated how to use the blender.\r'),
(67,1,'voucher','상품권','coupon','cash','All new car purchasers will receive a voucher.\r'),
(68,1,'expire','만료되다','end','renew','The lease on the commercial building expired last year.\r'),
(69,1,'invoice','청구서','bill','receipt','You\'ll receive an invoice for our services in a few days.\r'),
(70,1,'supplier','공급업체','vendor','client','We found a new screen supplier for our TVs.\r'),
(71,1,'deadline','마감 기한','limit','start','The deadline for the project is noon on Friday.\r'),
(72,1,'oversee','감독하다','supervise','follow','Charlotte oversees the company\'s sales team.\r'),
(73,1,'submit','제출하다','present','withhold','All applications must be submitted by Friday.\r'),
(74,1,'workload','업무량','burden','leisure','The holiday season greatly increased the workload.\r'),
(75,1,'accountant','회계사','bookkeeper','amateur','V&M Industrial is looking for an accountant.\r'),
(76,1,'headquarters','본사','office','branch','Fresha-Cola built a new corporate headquarters.\r'),
(77,1,'supervisor','관리자','manager','subordinate','My supervisor nominated me for a promotion.\r'),
(78,1,'budget','예산','funds','debt','Budget cuts forced the company to lay off employees.\r'),
(79,1,'estimate','견적서','quote','fact','The manager required two estimates for the repairs.\r'),
(80,1,'reimburse','변제하다','refund','charge','The company will reimburse staff for work purchases.\r'),
(81,1,'arrival','도착','landing','departure','The arrival area of the airport has a large waiting area.\r'),
(82,1,'destination','목적지','goal','origin','Thailand is a popular destination for divers.\r'),
(83,1,'itinerary','여행 일정표','schedule','deviation','Charlene sent her boss an updated itinerary.\r'),
(84,1,'luggage','수하물, 짐','baggage','carry-on','All carry-on luggage must fit in the overhead bins.\r'),
(85,1,'souvenir','기념품','keepsake','trash','Ms. Tanner bought small souvenirs for her children.\r'),
(86,1,'accommodation','숙박 시설','lodging','street','Beachwood Inn provides the most luxurious accommodations.\r'),
(87,1,'belongings','소지품','possessions','waste','Please take all of your personal belongings with you.\r'),
(88,1,'in advance','사전에','beforehand','afterward','There is no charge for bookings canceled in advance.\r'),
(89,1,'overbooked','초과 예약된','full','vacant','\"The hotel was overbooked, so we were offered a free room.\"\r\n1,reservation,예약,booking,cancellation,I have a reservation for a non-smoking room.\r\n1,affordable,가격이 알맞은,cheap,expensive,S-Club is a more affordable alternative.\r\n1,exchange,교환,swap,keep,You cannot exchange that item without a receipt.\r\n1,out of stock,재고가 없는,unavailable,available,\"I\'m sorry, but that TV is currently out of stock.\"\r\n1,purchase,구매하다,buy,sell,Many people purchase a new mobile phone each year.\r\n1,refund,환불,repayment,payment,I\'d like a refund for this defective cable.\r\n1,warranty,품질 보증,guarantee,risk,All electronics come with a 90-day warranty.\r\n1,annual,연례의,yearly,monthly,The annual report must be ready for the meeting.\r\n1,experienced,경험이 많은,skilled,green,The company is looking for an experienced consultant.\r\n1,perform,수행하다,execute,fail,Raises are based on job performance.\r\n1,recruit,채용하다,hire,fire,The company plans to recruit recent graduates.\r\n2,strategy,전략,plan,improvisation,The company developed a new strategy to increase sales.\r\n2,postpone,연기하다,delay,advance,They had to postpone the meeting due to bad weather.\r\n2,budget,예산,funds,debt,The project was completed within the budget.\r\n2,deadline,마감일,due date,extension,Please submit your report before the deadline.\r\n2,negotiation,협상,discussion,refusal,The negotiation lasted for several hours.\r\n2,promotion,승진,advancement,demotion,She received a promotion after her outstanding performance.\r\n2,inventory,재고,stock,shortage,The store needs to check its inventory regularly.\r\n2,invoice,송장,bill,payment,Please send the invoice to our accounting department.\r\n2,renovation,보수,restoration,demolition,The office is undergoing renovation this month.\r\n2,collaboration,협업,partnership,competition,The project was a result of collaboration between two teams.\r\n2,candidate,후보자,applicant,disqualified,She was the strongest candidate for the position.\r\n2,subscription,구독,membership,cancellation,The subscription fee is charged monthly.\r\n2,available,이용 가능한,accessible,unavailable,The manager is available for a meeting tomorrow.\r\n2,recommend,권장하다,suggest,discourage,I recommend you read this book before the exam.\r\n2,evaluate,평가하다,assess,ignore,The teacher will evaluate students\' performance next week.\r\n2,conduct,진행하다,carry out,cancel,The company will conduct a survey next month.\r\n2,contract,계약서,agreement,disagreement,Both parties signed the contract yesterday.\r\n2,expansion,확장,growth,reduction,The company is planning an expansion into new markets.\r\n2,sufficient,충분한,adequate,insufficient,Make sure you have sufficient time to finish the task.\r\n2,represent,대표하다,stand for,misrepresent,She will represent our team at the conference.\r\n2,approve,승인하다,authorize,reject,The manager approved the new project proposal.\r\n2,resolve,해결하다,solve,worsen,They worked together to resolve the conflict.\r\n2,distribute,배포하다,deliver,collect,Volunteers will distribute food to those in need.\r\n2,maintain,유지하다,keep,abandon,It is important to maintain a healthy lifestyle.\r\n2,publish,출판하다,release,suppress,The author plans to publish a new book next year.\r\n2,reserve,예약하다,book,cancel,I\'d like to reserve a table for two people.\r\n2,inspect,점검하다,examine,ignore,The engineer will inspect the equipment tomorrow.\r\n2,submit,제출하다,hand in,withdraw,Please submit your application by Friday.\r\n2,negotiate,협상하다,discuss,refuse,They are trying to negotiate a better deal.\r\n2,implement,시행하다,execute,cancel,The government will implement new policies next year.\r\n2,inform,알려주다,notify,conceal,Please inform us if there are any changes to the plan.\r\n2,reduce,줄이다,decrease,increase,The company aims to reduce costs by 20%.\r\n2,confirm,확인하다,verify,deny,Please confirm your attendance by sending an email.\r\n2,transfer,이동하다,move,stay,He was transferred to the Seoul branch last month.\r\n2,organize,정리하다,arrange,disorganize,She helped organize the annual company event.\r\n2,acquire,얻다,obtain,lose,The company acquired a new subsidiary last year.\r\n2,efficient,효율적인,productive,inefficient,We need a more efficient way to manage our time.\r\n2,flexible,유연한,adaptable,rigid,Our company offers flexible working hours.\r\n2,mandatory,필수적인,required,optional,Attendance at the training session is mandatory.\r\n2,temporarily,일시적으로,briefly,permanently,The office will be temporarily closed for repairs.\r\n2,competitive,경쟁력 있는,ambitious,uncompetitive,The company offers competitive salaries to attract talent.\r\n2,destination,목적지,endpoint,origin,Paris is a popular travel destination.\r\n2,reliable,신뢰할 수 있는,dependable,unreliable,She is a reliable employee who always meets deadlines.\r\n2,accurate,정확한,correct,inaccurate,Make sure all the data in the report is accurate.\r\n2,potential,잠재적인,possible,actual,She has the potential to become a great leader.\r\n2,launch,출시하다,release,withdraw,The company will launch a new product next month.\r\n2,replace,교체하다,substitute,keep,We need to replace the old equipment with new ones.\r\n2,significant,상당한,considerable,insignificant,There has been a significant increase in sales this quarter.\r\n2,permanent,영구적인,lasting,temporary,She was offered a permanent position at the firm.\r\n2,compensation,보상,payment,penalty,Employees receive fair compensation for their work.\r\n3,install,설치하다,set up,uninstall,They installed new software on all computers.\r\n3,arrange,정리하다,organize,disorder,She arranged the books neatly on the shelf.\r\n3,pavement,보도,sidewalk,road,He walked along the pavement.\r\n3,unoccupied,비어 있는,vacant,occupied,The apartment is currently unoccupied.\r\n3,lean over,~ 너머로 몸을 구부리다,bend over,straighten up,He leaned over the desk to pick up a pen.\r\n3,suspend,매달다,hang,lower,The lights were suspended from the ceiling.\r\n3,assemble,조립하다,put together,disassemble,They assembled the furniture quickly.\r\n3,position,배치하다,place,remove,He positioned the chair near the window.\r\n3,mandatory,의무의,compulsory,optional,Wearing a helmet is mandatory.\r\n3,supervise,감독하다,oversee,neglect,She supervises the construction project.\r\n3,promising,전망이 좋은,hopeful,discouraging,The new plan looks promising.\r\n3,deposit,입금하다,put in,withdraw,He deposited money into his account.\r\n3,exceed,초과하다,surpass,fall short,Sales exceeded expectations this year.\r\n3,transfer,이동하다,move,keep,She transferred the files to a new computer.\r\n3,assess,평가하다,evaluate,ignore,The teacher assessed the students\' performance.\r\n3,confirm,확인하다,verify,deny,Please confirm your reservation.\r\n3,approve,승인하다,grant,reject,The manager approved the proposal.\r\n3,indicate,명시하다,show,conceal,The results indicate a positive trend.\r\n3,negotiate,협상하다,bargain,refuse,They negotiated a better deal.\r\n3,recruit,모집하다,hire,dismiss,The company recruits new employees every year.\r\n3,appoint,임명하다,assign,remove,He was appointed as a director.\r\n3,malfunction,오작동하다,break down,function,The machine malfunctioned suddenly.\r\n3,prioritize,우선시하다,rank,ignore,You should prioritize your tasks.\r\n3,telemarketing,전화 판매,phone sales,direct sales,Telemarketing is still widely used.\r\n3,regulation,규정,rule,freedom,New regulations were introduced.\r\n3,banquet,연회,feast,fast,They held a banquet for the guests.\r\n3,preliminary,예비의,initial,final,The preliminary results are encouraging.\r\n3,hotline,서비스 전화,helpine,x,Call the hotline for assistance.\r\n3,demolition,철거,destruction,construction,The demolition of the building began.\r\n3,boost,신장시키다,increase,decrease,The campaign boosted sales.\r\n3,soar,치솟다,rise,plummet,Prices soared last month.\r\n3,utility expense,공과금,utility bill,income,Utility expenses are rising.\r\n3,expenditure,지출,spending,saving,Government expenditure increased.\r\n3,aside from,~을 제외하고,except for,including,\"Aside from rain, the trip was perfect.\"\r\n3,allotted,할당된,assigned,withheld,Time was allotted for questions.\r\n3,cease,중단하다,stop,continue,The company ceased operations.\r\n3,urge,권장하다,encourage,discourage,They urged him to apply.\r\n3,publication,출판물,release,suppression,This publication is popular among young readers.\r\n3,demonstrate,시연하다,show,hide,He demonstrated how it works.\r\n3,discontinue,(생산을)중단하다,stop,continue,The product was discontinued.\r\n3,conduct,실시하다,carry out,halt,They conducted a survey.\r\n3,emerging,신흥의,developing,declining,Emerging markets are growing fast.\r\n3,relocate,이사하다,move,stay,They relocated to another city.\r\n3,publicize,홍보하다,promote,conceal,The company publicized the event.\r\n3,resident,주민,inhabitant,visitor,The residents attended the meeting.\r\n3,spokesperson,대변인,representative,x,The spokesperson gave a statement.\r\n3,resolve,해결하다,solve,complicate,They resolved the issue quickly.\r\n3,component,부품,part,whole,This is a key component of the system.\r\n3,defective,결함이 있는,faulty,flawless,The product was defective.\r\n3,play it safe,위험을 피하다,avoid risk,take risks,He decided to play it safe and not invest his money.\r\n3,figure out,알아내다,understand,misunderstand,She finally figured out the answer.\r\n3,come up with,(해답 등을) 찾아내다,think of,give up,They came up with a great idea.\r\n3,develop,개발하다,improve,decline,The company plans to develop a new product.\r\n3,consistent,일관된,steady,inconsistent,His performance is consistent.\r\n3,compete,경쟁하다,rival,cooperate,Firms compete for market share.\r\n3,ensure,보장하다,guarantee,risk,Ensure all documents are complete.\r\n3,strategy,전략,plan,randomness,We need a better strategy.\r\n3,analyze,분석하다,examine,ignore,The team will analyze the data.\r\n3,accurate,정확한,precise,inaccurate,The report must be accurate.\r\n3,conference,회의,meeting,dismissal,She attended the conference.\r\n3,employ,고용하다,use,dismiss,The company employs many workers.\r\n3,factor,요인,element,result,Cost is a key factor.\r\n3,modify,수정하다,alter,maintain,Please modify the document.\r\n3,finalize,최종 확정하다,complete,delay,They finalized the contract.\r\n3,approve,승인하다,authorize,reject,The manager approved the plan.\r\n3,enable,가능하게 하다,allow,prevent,This system enables faster work.\r\n3,cost-effective,비용 효율적인,economical,expensive,It is a cost-effective solution.\r\n3,implement,시행하다,execute,abandon,The company will implement changes.\r\n3,comprehensive,포괄적인,complete,limited,The report is comprehensive.\r\n3,reveal,밝히다,disclose,conceal,The survey revealed new trends.\r\n3,maintain,유지하다,sustain,neglect,Maintain high quality standards.\r\n3,efficient,효율적인,effective,inefficient,The process is efficient.\r\n3,establish,설립하다,found,dissolve,They established a new branch.\r\n3,manufacture,제조하다,produce,consume,The factory manufactures goods.\r\n3,distribution,분배,allocation,concentration,Distribution is handled centrally.\r\n3,perform,수행하다,execute,fail,Employees must perform well.\r\n3,maintenance,유지 보수,upkeep,neglect,Regular maintenance is required.\r\n3,anticipate,기대하다,expect,doubt,We anticipate high demand.\r\n3,domestic,국내의,local,overseas,Domestic sales increased.\r\n3,dimension,크기,size,limitlessness,Check the dimensions carefully.\r\n3,temporarily,일시적으로,briefly,permanently,The store is temporarily closed.\r\n3,eager,열망하는,enthusiastic,reluctant,She is eager to learn.\r\n3,accessible,접근 가능한,available,inaccessible,The website is easily accessible.\r\n3,navigate,탐색하다,browse,misdirect,Users can navigate the site.\r\n3,boost,증가시키다,increase,reduce,The campaign boosted sales.\r\n3,specify,명시하다,state,generalize,Please specify your needs.\r\n3,merge,합병하다,combine,separate,The companies merged last year.\r\n3,plenty of,많은,abundant,scarce,There are plenty of options.\r\n3,ancient,고대의,old,modern,The site is ancient.\r\n3,species,종,type,individual,Many species are endangered.\r\n3,formation,형성,creation,destruction,Cloud formation occurs quickly.\r\n3,marvel,감탄하다,admire,ignore,Tourists marvel at the view.\r\n3,subscription,구독,membership,cancellation,She renewed her subscription.\r\n3,accommodation,숙소,lodging,eviction,The hotel provides accommodation.\r\n3,destination,목적지,endpoint,origin,Paris is the destination.\r\n3,route,경로,path,dead end,This route is faster.\r\n3,oversee,감독하다,supervise,neglect,He oversees operations.\r\n3,extend,연장하다,prolong,shorten,They extended the deadline.\r\n3,initiate,시작하다,launch,stop,The company initiated a project.\r\n3,raise,올리다,increase,lower,They raised prices.');
/*!40000 ALTER TABLE `words` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-24 17:23:28
