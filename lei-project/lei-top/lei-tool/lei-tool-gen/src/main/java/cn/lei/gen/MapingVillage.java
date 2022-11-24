package cn.lei.gen;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;

/***
 *@author wanglei
 *@Date 2022/11/22 15:42
 ***/


public class MapingVillage {

    private final static String[] county_key = {"县", "区"};
    private final static String[] town_key = {"镇", "街道", "乡"};
    private final static String[] village_key = {"村", "社区", "居民居委会", "村民委员会", "村委会"};

    private final static String village = "八角塘社区,白鸥园社区,白石村,北门村社区,茶山路社区,茶圣中路社区,朝阳村,车头村,畴口社区,大公厂社区,大井头社区,带湖路社区,丁家洲社区,东都花园社区,东风村,东门新村社区,东塘村,东瓦窑村,豆芽巷社区,渡口社区,丰溪路社区,凤凰社区,沽塘社区,管家村,郭门社区,何家村,河中巷社区,霍村村,吉阳山社区,稼轩社区,建新社区,箭道巷社区,解放社区,解放河社区,解放路社区,金龙岗社区,金山社区,劳动路社区,老坞村,李家村,灵湖村,灵溪社区,刘家坞社区,龙泉村,龙潭社区,龙头村,龙芽亭社区,路底村,马家弄社区,茅家岭村,民主社区,南门路社区,盘石村,铅岭村,桥村社区,秦峰村,青金村,青石村,青岩村,庆丰社区,日升村,三官殿社区,三里亭社区,沙溪街社区,上滩头社区,邵新村,胜利社区,胜利社区,胜利路社区,狮山社区,施家山社区,十里村,石垅孔村,世纪花园社区,市府大院社区,书院路社区,水南社区,四吉社区,松山社区,宋宅村,塔水村,滩头社区,体育馆路社区,天津桥社区,铁二社区,铁三社区,铁五社区,铁一社区,同心社区,外沽塘社区,汪家园社区,王村村,文通巷社区,五桂山社区,五里村,五三小区(1)社区,五三小区(2)社区,五石村,西畈村,西园村,溪边村,下湖村,下滩头社区,下潭社区,下源村,现代城社区,向阳村,新塘村,岩坑村,沿城社区,杨家湖社区,杨家石桥社区,英塘村,油麻坞村,淤里村,月泉社区,詹村村,张家村,中山路社区,中潭村,钟灵社区,周田村,祝家巷社区,紫阳社区,紫园社区,八都社区,白鹤畈社区,百花村,抱坞亭村,鲍坞村,北门社区,碧石村,边山村,蔡村村,柴九洋村,澄村村,赤塘村,大尖山社区,大门底村,大南村,大坪社区,大石山村,大石头村,大塘底村,大塘角社区,大阳亭村,大洋村,大洲村,东关社区,东街社区,东井村,东山村,东塘村,东阳社区,渡头社区,墩头村,舵阳村,二渡关村,畈上村,方村村,傅家棚村,富山村,港口村,高厅村,高阳村,公堂村,古城村,古村村,官塘社区,管村村,和尚渡村,河源村,荷坞村,横路社区,鸿坛村,后垄村,后溪村,后阳村,壶峤社区,壶山村,湖边社区,湖丰社区,湖口村,湖头社区,湖沿社区,花棚村,槐芳村,黄丰村,黄家山村,黄家淤村,黄狮村,回树底村,吉塘村,家潭村,尖山村,枧底社区,蒋坞村,交溪村,茭塘村,金墀社区,军潭村,坑东村,昆山社区,兰田村,李家村,里洋村,莲鼓村,岭底村,流源社区,六都村,龙潭村,龙溪村,路亭山村,麦园社区,毛村村,毛溪村,苗山村,庙林村,南屏社区,南山社区,廿三都村,廿四都社区,鸟林街社区,排山社区,牌门村,平安社区,普塘村,七都社区,七星村,前村村,前山村,前洋村,桥头村,青桥村,清塘村,清淤村,泉波村,泉岭村,卅八都村,三都村,三官殿社区,三里村,沙田村,沙溪村,山头村,杉江社区,商城社区,上呈村,上孚村,上铺村,少阳村,社后村,深坑村,胜利村,十都村,十六都村,十一都村,十字垄村,石桥村,石人村,石山村,石溪村,石谢社区,石岩村,双峰村,双井村,双桥村,双塘村,水北社区,水阁村,四公村,松林村,苏塘社区,苏溪村,塔山村,塘边村,塘墀社区,塘上村,塘狮村,塘头社区,塘溪社区,田青铺村,铁山村,桐畈社区,铜坑村,铜山村,王家村,王家畈村,王家坞村,王坑村,王洋社区,翁岭村,卧龙城社区,乌岩村,吴村社区,梧桐坞村,五都社区,五角塘社区,五里社区,坞垄村,西湖街社区,西门社区,西山社区,西山底村,西坛社区,西溪社区,溪边村,溪山社区,溪滩村,溪头村,溪西村,溪淤村,峡源村,下坊社区,下社村,下余村,仙洲村,项家村,小丰村,小康城社区,新村村,新塘村,修文街社区,徐家村,严村社区,杨村村,杨柳村,杨坞村,洋江社区,养塘村,叶家村,义星街社区,吟阳村,银峰村,余村村,余坡塭村,玉田村,裕丰社区,源溪社区,战畈村,赵塘村,郑村坞社区,中山街社区,中心街社区,洲头社区,朱狮社区,朱坞村,竹岩村,祝家墩社区,梓里村,紫坞村,713矿社区,安坑村,八都社区,八景路社区,白塔村,板桥村,包家村,北山村,碧霞村,蔡家村,岑峰村,茶亭社区,茶园村,常阜村,车边村,陈墩村,稠川村,船坑村,大地村,大畈村,大济村,大屋村,大溪村,岛山村,丁家村,丁家仓村,丁宅村,东坑村,东灵村,东山村,东升社区,东田村,东汪村,东坞村,董团村,墩底村,墩头村,恩山村,畈头社区,畈心村,枫林村,枫岭村,枫岭头村,冯家村,凤凰社区,佛母村,浮墩村,傅家村,甘溪村,高畈村,高门村,高潭村,高洋村,高洲村,革畈村,葛路村,观上村,何村村,荷家村,荷叶村,横山村,横山头社区,红门村,红石村,洪家村,后畈社区,后坪村,后田村,湖村村,湖墩村,湖山村,湖潭村,花厅社区,黄坑村,黄岭村,黄沙村,黄石村,黄塘村,黄源社区,煌固村,吉安村,吉阳村,挤腰村,江家村,姜村社区,姜山村,金鸡村,金钟山村,井边村,九狮村,坑口村,库前村,昆山村,冷水村,李村村,鲤洋村,联合村,联星村,廖家村,灵峰村,岭下村,流源村,楼村村,罗桥社区,麻墩村,麦埂坞村,毛湾村,毛村村,毛埂村,毛楼村,毛棚村,毛源村,毛宅村,茗洋村,南峰村,南岩村,鸟桥村,彭家坞村,彭宅村,鄱阳社区,七峰村,七六社区,前程村,前坊村,前山社区,前汪村,钱墩村,桥下社区,青山村,清泉社区,清水村,泉塘村,泉洋村,儒坞村,三都村,三连坑村,三联村,山底村,杉树村,上乐村,上泸社区,石门村,石人村,石狮社区,石峡村,石嘴村,双龙村,双溪村,双源村,水垄村,松岭社区,松坪村,苏家村,苏桥村,台湖村,太平村,塘里村,塘里村,田墩社区,铁山村,桐西村,童坞村,汪村村,汪岭村,汪宅村,王家坝社区,王家店村,王家山村,望仙村,惟义社区,文家社区,吴洲村,五村村,西湖村,西龙岗村,西山村,西岩村,溪北村,下裴村,下山社区,仙山村,象山村,小东坞村,小溪村,小源村,新科社区,新田村,信江社区,信美社区,徐家村,徐坞村,旭日社区,沿畈村,羊石村,阳光社区,杨桥村,洋塘村,窑山村,应坊村,应家村,永丰村,永乐村,源塘村,源溪村,月亮湾社区,皂头社区,詹家村,樟村村,樟宅桥村,长塘村,长塘村,振华社区,郑坊社区,郑宅村,纸坊村,中畈村,中路村,中魏村,中洲村,周村村,周墩村,周石村,周坞村,洲村村,苎圳村,祝狮村,紫云村,茡荠塘村,尊桥村,左溪村,坳村村,八磜村,八仙洞村,白泥村,白桥村,白石村,百果村,十里山社区,包溪村,仓畈村,仓坞村,曾家村,柴门村,车头村,程村村,川桥村,打铁坞村,大葛村,大举村,大垄村,大路边村,大西坑村,大洋村,大玉村,大园地村,徐村社区,底坞村,殿口村,丁村村,定湖村,东坳村,东津桥村,东坑村,东门村,东山头村,东社村,东巷村,渎口村,金山社区,碓头村,墩头村,樟村,方塘村,坊头村,枫林社区,凤叶村,斧市村,港口村,埂头村,古城社区,古山村,关口村,关山桥村,官仓边村,毛家社区,官宅村,广平村,和平村,横街社区,三里街社区,横塘村,临江湖社区,邱家社区,后陈村,后垄村,后叶村,胡村村,湖村桥村,花桥村,华山村,皇珠村,黄坳村,黄茅坞村,嘉湖村,建设村,江口村,姜宅社区,蒋家山村,横路街社区,金坪村,板桥社区,砻坊街社区,金溪社区,锦溪村,进士村,均郑村,梨园村,山边社区,燕子窝社区,横溪社区,岭山村,岭头山村,六村村,六都村,金桥社区,龙琴社区,万柳洲社区,陇首村,仑溪村,吕畈村,吕家源村,马岭底村,马路社区,吴家社区,毛家垄村,毛塘村,毛宅村,茗坑村,南阳村,南源村,平埂村,七里街社区,前坞村,前周村,桥村社区,桥町坞村,桥棚村,青边村,青山坝村,清水塘村,清溪村,清溪桥村,莲湖社区,泉眼村,茹茅村,赛头社区,三都社区,十字街社区,三亩村,桑园村,纱帽村,六亩社区,山塘村,上畈村,上湖田村,上西坑村,生姜村,洪家社区,十七都村,莲塘社区,石牌村,石笋村,石塘村,舒村村,金交社区,双溪村,双溪口村,双元村,水阁社区,四都村,四股桥村,四甲村,松岭村,苏村村,太甲村,太平村,潭头村,塘顶村,塘尾村,塘西村,陶源村,田畈村,土城村,外山村,湾村村,万花村,东门社区,王村村,王村畈村,王坊村,王家坝村,王石村,文成村,乌鹰村,官溪社区,五里洋村,坞口村,西坑村,西山村,溪北村,下仓村,下坊村,下濂溪村,下坛村,下徐村,下喻村,下珠村,县后山村,小徐村,新康村,新塘村,道堂社区,端明社区,许家村,岩洲村,雁门村,舒家棚社区,杨家村,杨宅村,洋塘村,洋岩村,窑山村,叶桥村,营盘村,永久村,淤里村,余佛村,玉峰村,玉坑村,玉马村,玉溪社区,院边村,藻溪村,宅前村,詹畈村,张村村,张岭村,方村,樟木村,涨畈村,郑家墩村,中村村,中店村,中关村,中坛村,周佃村,周家坞村,周山村,周溪村,珠湖村,竹川村,竹笕村,竹岭村,竹园村,祝村村,卓家村,紫湖村,艾家村,安兰村,安洲村,八都村,八水源村,柏畈村,傍罗村,北门村,蔡家村,岑源村,柴家村,车盘村,陈坊村,陈坊街社区,陈家寨村,城东社区,城南社区,城西社区,大横村,大田村,大岩村,叠石村,东湖村,东门社区,东山村,鹅湖村,飞蛾村,凤来村,福田村,港背村,港东村,港沿村,港洲村,高岭村,高磜村,高泉村,公果村,沽溪村,管源村,韩家村,汉阳村,河背村,河西村,荷田村,横林村,横塘村,虹桥村,后畈村,后田村,后洲村,湖村畈村,湖坊街社区,湖塘村,花亭子村,黄岗山社区,篁碧村,篁村村,火星村,枧山村,江村村,江家村,江家村,浆源村,蒋家村,荆林村,九狮村,局里村,坑口村,孔家村,李叶村,莲花村,莲塘村,林家村,留桥村,垄西村,卢家村,罗溪村,麻车村,马鞍村,茅排村,庙湾村,南耕村,南湖村,排上村,彭村村,彭桥村,铺前村,七里村,前进村,桥北村,桥亭村,青洲村,清湖村,清流村,汭口村,沙畈村,沙溪村,山头村,上港村,上古埠村,畲族村村,狮江社区,十都村,十一都村,石涵村,石垄村,石垄村,石桥村,石塘村,石塘街社区,石溪村,石溪街社区,双合村,太源村,檀合村,塘尾村,万年村,汪二村,汪二街社区,汪源村,王畈村,文家桥村,文山村,翁溪村,乌石村,吴家村,五都村,五都街社区,西畈村,西坑村,西门社区,西山村,西洋村,下程村,下畈村,下古埠村,下渠村,下四村,下徐村,项源村,斜岭村,雄田村,徐家村,薛家村,岩前村,杨村村,杨村街社区,杨家村,杨家桥村,杨箭村,洋田村,洋洲村,窑山村,银村村,英将村,永平村,尤田村,尤源村,余源村,虞家村,玉石村,月塘村,詹村村,长港村,长岭村,长生村,长寿村,轸源村,中村村,中李村,中洲村,洲上村,朱村村,紫溪村,紫溪街社区,紫源村,走马村,白沙岭社区,百家村,蔡家村,蔡坞村,岑港村,槎源村,朝堂村,陈村湾村,城北社区,城东社区,城郊村,城南社区,城西社区,城中社区,崇山村,丁家村,坊源村,枫林村,港边村,葛源村,古楼村,关田村,琯山村,何家村,后占村,黄家村,黄山村,黄藤村,黄溪村,篁村村,廻垅村,建作村,姜家村,金鸡村,九甲村,柯家村,兰子村,莲荷村,灵西村,刘家村,龙门村,鲁村村,满团村,牛桥村,排楼村,铺前社区,铺前村,七甲村,钱家村,青板村,清湖村,山田村,善塘村,上畈村,石桥村,司铺村,宋村村,童家村,土岩村,溪畈村,霞坊村,霞阳村,兴安社区,徐村村,薛家村,杨家村,洋叶村,姚家村,宜兴村,义门村,余塘村,园区社区,宝峰村,宝石村,北街社区,蔡家村,曹溪村,朝阳村,车站街社区,陈塘村,程畈村,程家村,程桥村,慈竹村,大坝村,大港村,大树村,大塘村,店上村,东港村,东街社区,东源村,东站社区,芳墩村,芳湖村,甘家山村,港渡村,港口村,葛溪村,官源村,管家村,光辉村,广兴村,圭峰村,过港村,汗墩村,菡潭村,荷树畈村,荷塘村,横桥村,湖桥村,湖塘村,湖西村,瑚琳村,虎山村,花亭社区,花亭村,黄家源村,火桥村,建岭社区,箭竹村,江燎村,蒋坊村,窖头村,赖家村,雷兰村,李畈村,李桥村,栗桥村,栗塘村,连胜社区,莲湖村,烈桥村,林畈村,刘家村,流口村,龙家村,龙门湖社区,龙山村,罗家村,马鞍村,马鞍村,马山村,毛家村,米岭村,庙脚村,庙前村,南岩村,内洪村,漆工社区,旗山村,桥畈村,清湖村,沙湾村,杉山街村,上坊村,上坑村,上童村,上张村,邵畈村,蔬菜村,双港村,双亭社区,水南村,潭石村,塘坪村,田东村,铁沙村,外洪村,王家村,翁家村,乌垄村,西街社区,西坑村,西李村,西童村,西源山村,溪湾村,下范村,下琬村,下叶村,仙湖村,仙台村,显南村,小店村,新屋村,徐门村,岩山村,杨桥村,杨桥村,洋泥畈村,姚畈村,窑上村,叶坝村,永阳社区,余仓村,园竹村,錾山村,张湾村,樟树墩村,长源村,招宾村,贞畈村,直源村,中畈村,中屋村,周店村,周潭村,祝家村,邹山村,八圩村,把山村,白家圩村,白马桥村,白云村,百湖村,柏叶房村,宝珠村,保安山村,北苑社区,边山村,滨江社区,滨塘村,蔡坊村,蔡垄村,仓前村,曾家畈村,茶林村,茶子园社区,柴店村,常山村,陈家塘村,陈坪村,程坊村,程家村,赤岸村,赤岗村,赤岭村,大都村,大港村,大淮村,大口村,大沙湖村,大山村,大山村,大田村,大屋村,大溪村,大源垄村,德胜社区,邓墩村,东方村,东风村,东河村,东红村,东梅村,东门社区,东山社区,东昇社区,东塘村,东湾村,东源村,董家村,杜家岭村,墩上村,畈程村,畈上村,畈上村,畈头村,方樊村,枫港村,枫林村,枫林湾村,枫树村,枫塘村,枫塘村,凤凰村,凤颈村,府山村,傅家弄村,富湾村,富裕村,甘泉村,干港村,干越社区,港背村,港边村,高峰村,高峰村,高坑村,高门村,高桥村,埂上村,古埠村,古楼社区,古山村,古塘村,古竹村,瓜畲村,挂口村,关口社区,龟山村,郭泗村,墎坪村,壕源村,濠湖村,号嘴村,禾山村,禾山集镇社区,合港村,何埠村,何家村,何家村,和爱村,和平村,河桥村,河源村,鹤源村,横岗村,红莲村,洪埠村,后港村,后湖村,后山村,后塘村,后沿村,胡坊村,胡家洲村,湖滨村,湖田村,湖西村,湖溪村,花墩村,花园村,华山村,槐梓村,黄岗村,黄岗寺村,黄芽村,驾湖村,枧头村,江埠村,江家村,江家山村,江坪村,蒋坊村,蒋家村,金埠村,金电社区,金航社区,金山村,金滩村,金塘社区,金信社区,锦边社区,禁山村,库管村,劳动村,老虎口村,雷湾村,雷溪渡村,冷井村,黎背村,李家渡村,李塘村,李湾村,里溪村,莲池村,联合村,联兴村,梁山村,菱塘村,岭底村,岭上村,刘埠村,刘家村,柳林村,龙津村,龙塘村,龙塘社区,龙源社区,楼埠村,鹭鸶港村,罗家村,绿源村,毛坊村,毛溪社区,梅港村,梅岭村,米湾村,眠山村,民安村,闵坊村,明湖村,茗桂花园社区,南墩村,南岗村,南谷村,南关村,南门社区,南坪村,南塘村,南源村,宁岗村,藕塘村,牌岗村,牌头村,琵琶洲社区,坪上村,迁移村,前坊村,前进村,前进村,前山村,前徐村,前沿村,桥里村,桥头村,青林村,青山村,邱家村,阮家村,润溪村,箬源村,三畈村,三房村,三湖村,三联村,三塘村,三溪村,三星社区,三异村,山背村,山里村,山塘村,山下村,山岩村,山源村,上曹村,上行村,上洪村,上谭村,上湾社区,上湾村,上西源村,上兴村,蛇塘村,社赓村,神埠村,神口村,胜利村,石口村,石岭村,石门村,石山村,石溪村,石溪村,石柱村,双港村,四合村,四一村,寺前村,松山村,松霞源村,塔前村,塔尾村,太和村,太阳社区,炭埠村,汤村村,汤源村,塘背村,塘湾村,塘西村,桃源村,腾溪村,同良畈村,同心村,铜鼓包村,童埠村,潼湖村,潼口村,涂坊村,涂家村,土桥村,团湖村,团结村,团林村,湾头村,万潭村,汪塘村,王化村,王家村,王家村,维城村,乌泥村,吴艾村,吴家村,五彩山社区,五福村,五雷村,五菱村,西岗村,西门社区,西坪村,西源村,霞山村,下谭村,下湾社区,下西源村,象山村,小山村,谢家村,新墩村,新建社区,新桥村,新芹村,新塘村,信丰村,幸福村,秀水社区,徐家村,严溪村,沿港村,沿河村,燕湖村,阳光社区,杨家村,杨源村,尧嘴村,迎宾社区,迎康社区,永安社区,永兴村,油源村,渔池村,袁墩村,源头村,院前村,云头村,早里源村,增产村,榨下村,寨上村,寨源村,沾渡村,詹坊村,詹家村,詹湾村,张坊村,张扬村,樟山村,长吉村,长山村,赵家村,折都村,镇郊村,镇尾村,中坊村,中埂村,中湖村,中山村,中湾社区,周家村,周桥社区,洲上社区,朱湾村,株桥村,邹坊村,左桥村,爱民村,白天鹅社区,白杨村,柏树下村,板埠桥村,板桥村,板塘村,半港村,包丰村,北丰村,北富村,北关村,北湖村,北门村,北塘村,北旺村,北兴村,北源村,碧山村,表恩村,滨田村,波丰村,波湖村,布袋村,埠丰村,蔡家村,蔡家湾村,曹家村,曹家嘴村,草埠村,茶塘村,茶园村,车廊村,车门村,陈高村,陈岭村,城北社区,城东社区,城墩村,城隍庙社区,程家村,程塘村,船湾村,创业村,春前村,茨山村,大畈村,大吉村,大利村,大牛湖村,大山村,大塘村,大塘村,大塘铺村,大田村,大王山村,大溪村,大霞村,大巷口社区,大岩村,大源村,大芝路社区,大宗村,道汊村,德化桥社区,邓畈村,邓家村,荻溪村,东堡村,东风村,东高村,东红村,东湖社区,东湖村,东康村,东朗村,东门渡村,东朋村,东桥村,东山村,东山村,东山畈村,东溪村,东阳村,东源村,董红村,董林村,董坪村,独山村,渡头村,段畈村,段庄村,发扬村,范田村,畈上村,畈徐村,方毕村,方宋村,分水岭村,丰产村,丰塘村,丰田村,丰源村,风雨山村,枫术村,枫树林村,凤嘴村,福山村,付家村,富林村,港北村,港湖村,港头村,高坊村,高峰村,高家村,高家岭村,高家圩村,高桥村,高沙村,高田村,高溪村,高源村,共和村,孤山村,孤山村,古北村,古枫村,古南社区,观前村,官田村,官田里村,官庄村,管驿前村,灌塘村,广场社区,广畈村,广洲村,桂湖村,桂花村,桂林村,桂湾村,桂湾村,桂中村,郭贺村,国安村,过江村,过水埂村,韩山村,韩湾村,汉桥村,濠湖村,合禄村,何彭村,和丰村,和平村,河北村,河东村,河港村,河西村,荷塘村,横河村,横坽村,横溪村,红岭村,红土山社区,红英村,洪曹村,洪门口社区,洪源村,侯岗村,后屋村,胡家村,胡家村,湖滨村,湖城社区,湖东村,户里村,户外村,花桥村,花园村,花园里村,华林村,华岭村,华龙村,华山村,华山村,华新村,化民村,淮王坦村,黄村村,黄家洲村,黄坽村,凰岗村,洄源村,鸡峰村,积谷村,激扬桥社区,吉潭村,计林村,枧田社区,建桥村,建设村,建阳村,江村桥村,江家岭村,江家山村,江叶村,蒋坊村,茭溪村,角山村,金方村,金鸡村,金家村,金楼村,金盘岭社区,金山社区,金潭村,金亭村,金源村,金竹村,荆华村,荆塘村,九流村,九湾村,九眼井村,九虞村,矿山村,朗埠村,乐安村,乐湖村,乐亭村,乐兴村,雷村村,黎岭村,礼恭脑村,李山村,李嘴村,利滨村,利池村,栎林村,栎树村,莲北村,莲池村,莲东村,莲丰村,莲港村,莲湖村,莲华村,莲麓村,莲南村,莲青村,莲山村,莲西村,联合村,联群村,良田村,良种场村,林桥村,林业村,灵芝门社区,坽曹村,坽口村,刘家村,刘家村,六塘村,龙陂村,龙丰村,龙口村,龙岭村,龙潭村,龙头村,龙头山村,龙尾村,龙西村,龙燕村,龙阳村,垄里村,楼下村,芦埠村,芦林村,芦田村,炉下村,路口村,罗井村,罗龙村,罗山村,麻埠岭村,麻下村,马鞍山社区,马埠村,马墩村,马湖村,马家村,马家冲社区,马头村,马赵村,莽塘村,毛家村,茅岭村,梅岭村,美林村,庙前村,民主村,闵桥村,明德村,鸣山村,鸣山庙社区,磨刀石村,慕礼村,南滨村,南畈村,南湖村,南林村,南门村,南培村,南山村,南水村,南园村,南庄村,内湖村,内清村,泥滩村,泥湾村,年丰村,聂家村,牛马坦村,暖水村,藕塘村,牌港村,牌楼村,牌楼新村村,潘村村,彭曹村,彭丰村,彭家村,铺前村,铺田村,其林村,前杨村,钱家村,乾湾村,桥北社区,桥南村,桥南社区,桥头村,桥头村,青湖村,青林村,青龙村,青泥村,青泉村,青山村,青水村,清塘村,清溪村,鹊塘村,群众村,饶埠社区,饶州社区,任家村,荣七村,瑞洪村,三汊村,三村圩村,三汲坊村,三门村,三庙前社区,三十里康村,三潼镇村,沙堤村,沙塘村,沙洲村,山背村,山闾村,山水天下社区,上兰村,韶田村,畲埠村,畲塘村,蛇山村,舍头村,神山村,狮子门村,十八坊社区,十字河村,石家村,石林村,石门村,石门街社区,石上村,莳山牌楼村,舒埠村,树下村,双丰村,双港村,双坽村,双桥村,水产村,四十里街村,寺前村,松林村,孙坊村,塔李村,踏溪村,太平村,太平坦村,太阳村,滩口村,滩上村,滩头村,谭家村,唐湖村,塘头村,塘西村,塘下村,桃溪村,天堂村,田畈村,田畈街社区,田铺村,铁峰村,铁炉铺村,铁路村,铁门村,同德村,同兴村,同兴村,桐湖村,桐山村,铜钱村,潼东村,潼丰村,潼港村,潼莲村,土塘村,团丰村,团结村,团结村,团林村,团群村,团张村,屯田村,瓦燮坝村,湾埠村,湾头村,晚禾村,万安村,汪家村,汪家村,汪家圩村,汪坽村,汪桥村,汪洋村,王畈村,吴家村,吴张村,蜈蚣村,五十里岗村,五一路社区,西分村,西港村,西湖村,西门村,西山村,溪口村,下岸村,下岸村,下常村,下炉村,向阳村,小渡村,小港村,小华村,小龙桥社区,小路口村,谢家滩社区,新曹村,新村村,新畈村,新畈村,新岗村,新建村,新联村,新岭口村,新路村,新民村,新桥社区,新石村,新塘村,新田村,新兴村,新义村,星塘村,徐步村,徐墩村,徐家村,徐塘村,鸦桥村,鸦鹊湖村,研下村,晏桥村,杨梅桥村,杨塘村,杨源村,洋埠村,尧丰村,尧山村,姚公渡村,姚家村,叶门村,义门村,驿田村,银宝村,英豪村,应家村,永丰村,永林村,永平村,永滩村,永兴农贸社区,油墩村,油墩街社区,游城村,余畈村,余沈村,鱼塘村,雨田村,玉田村,裕丰村,鸳鸯村,云峰村,云湾村,詹家墩村,站前村,张家村,张家坽村,章刘村,漳田村,漳溪村,樟潭村,长方村,长丰村,长山村,长山垄村,赵家村,柘港村,柘坽村,柘下村,郑家村,芝田村,中垱村,中心村,中心花园社区,中新村,钟岸村,周畈村,周家村,周家村,朱家村,朱家桥村,珠田村,竹林村,祝庄村,白马村,白竹村,板舒村,榜林村,标林村,滨溪社区,昌港村,程源村,大黄村,大源村,垱下村,稻香社区,东景社区,东南村,东源村,渡港村,畈民村,方家村,丰林村,丰收社区,富厂村,富林村,岗上村,港边村,高墩村,葛毛坞村,公园社区,共和村,古阳村,观音阁社区,国泰社区,合田村,河东村,荷桥村,荷塘村,荷溪村,后张村,湖云村,虎山村,虎头岗社区,黄柏村,黄墩村,黄家村,黄坪村,黄营村,惠民社区,夹罗村,建安社区,江家村,江泥社区,江田村,江源村,郊区村,椒源村,界福村,井路村,珏田村,坑边村,坑堧村,库田村,奎田村,蓝塘村,老街社区,桐源村,乐华村,李家村,栎山村,联合村,林川村,刘夏村,龙港村,罗湖村,麻畲村,马家村,马塘社区,南畈村,南岗村,聂家村,盘田村,裴家村,彭家村,坪上村,齐埠村,青云村,邱夏村,燃湖村,山背村,山下村,上坊村,上汪村,烧桥村,蛇湾村,社里村,射林村,射田村,石鼓村,石李村,石下村,石镇村,史桥村,双山村,松竹村,苏桥村,塘背村,塘边村,铁马社区,桐源村,湾里村,万和村,万民村,万年峰村,汪家村,吾峰村,吴林村,五一村,西北村,西湾村,细港村,下门村,下湾村,夏营村,新华社区,新华村,新建村,新乐村,星明村,珏田村,雅岗村,严家村,岩山村,杨芳村,杨桥村,姚西社区,姚源村,永安社区,永乐村,余芦村,余源村,虞坊村,玉津社区,玉溪社区,板舒村,越溪村,站前社区,中洲村,周家村,周湾村,朱砂村,珠山村,珠田村,珠湾村,邹畈村,左畲村,白石村,白石源村,曹村村,曹门村,槎口村,车田村,城关村,城口村,程村村,程家湾村,冲田村,词坑村,大畈村,大潋村,大山头社区,大汜村,戴村村,戴家村,低源村,东岭坞村,东石村,东头村,东园村,董家村,段莘村,对坞村,方村村,汾水村,凤山村,浮溪村,赋春村,高枧村,高砂村,古蜀地村,古坦村,官坑村,官桥村,涵春社区,和村村,河东村,河山坦村,河西村,荷田村,横槎村,横街社区,虹冲村,虹关村,洪村村,洪家村,洪坦村,洪源上村村,洪源下村村,胡家村,湖林村,湖山村,虎溪村,花园村,花园域社区,黄村村,黄砂村,黄源村,济溪村,甲路村,江湾村,金坑村,菊径村,莒莙村,考水村,坑口村,阆山村,朗湖村,冷水亭村,关口社区,李坑村,里村村,里源村,理坑村,立新社区,栗木坑村,莲花芯社区,林塘村,岭脚村,岭溪村,岭下村,龙山村,龙潭村,龙尾村,庐坑村,庐坑岭村,马家村,梅林村,梅田村,排前村,潘村村,盘坑村,盘山村,七里亭社区,齐村村,前段村,前坦村,青石村,清华村,庆源村,秋口村,秋溪村,蚺城社区,仁洪村,儒学前社区,瑞虹社区,沙城社区,善坑村,上梅洲村,上溪村,诗春村,双河村,水埠头村,水岚村,思口村,思溪村,太白村,汤村村,桃溪村,天佑社区,通元村,桐木土太村,沱口村,汪槎村,汪村村,汪口村,王村村,王家墩村,文博社区,文公社区,吴源村,浯村村,武口社区,西岸村,西冲村,西坑村,西山村,西垣村,西源村,霞港村,下溪村,香田村,向阳村,项家埠村,小港村,小沱村,晓林村,晓起村,晓鳙村,新街社区,新田村,新屋村,秀水村,许村村,薛村村,严田村,言坑村,岩前村,砚山村,杨村村,杨坑村,杨溪村,一都村,裔村村,雍溪村,游山村,游汀村,渔潭村,玉坦村,云丘社区,臧坑村,占才村,占坑村,张村村,鄣山村,长降社区,长林社区,长滩村,长溪村,长尧村,镇头村,中村村,中云村,中洲社区,钟吕村,周家山村,周溪村,朱塘社区,洙坑村,洙西村,梓槎村,柏溪社区,板桥村,昄大村,彩虹桥社区,陈坊村,笪家庄村,大畈村,大田村,店前村,吊钟村,丁村村,定坑村,东坞村,杜村村,墩上村,凤仪门社区,傅家墩村,富家坞社区,港首村,港西村,古圳头社区,桂湖村,海口村,海乐社区,横港村,红山社区,胡家村,花林村,花桥村,黄柏村,黄柏洋村,黄渡村,会源社区,基建队社区,洎水社区,建节水社区,江田村,焦坑村,界田村,金城社区,金家社区,锦坑村,聚远社区,肯堂山社区,兰村畲族村,乐安社区,梨园社区,李宅村,立新村,立信社区,龙头村,炉里村,炉湾村,泸口村,梅溪村,密川村,南岸村,南墩村,南溪村,农科新社区,暖水村,女儿田社区,浅港村,绕二村,瑞港村,三清社区,沙畈村,尚和村,胜利亭社区,舒家村,舒塆村,双河社区,双溪社区,水口村,水绿桥社区,宋家村,苏家村,岁寒山社区,潭埠村,潭兴社区,塘湾村,体泉村,天门山社区,铜埠社区,铜城社区,瓦源村,万村村,汪村村,汪杨社区,王村村,文港村,吴园社区,五星社区,武安路社区,西坑村,香屯街社区,新岗山社区,新建村,新南社区,新屋村,新营二居社区,新营三居社区,新营一居社区,新源社区,幸福社区,杨家湾社区,洋田村,瑶畈村,叶村村,银鹿社区,银泉社区,银山社区,引浆畲族村,油榨村,渔塘村,园林社区,园艺社区,詹村社区,占才村,张村村,张家畈社区,长乐社区,长田村,昭林村,中村村,中洲村,重溪村,祝家社区,宗儒村,蔬菜社区,西山林场,乐源村,金御湾社区,马岭村,洪山社区,港王社区,龙家村,徐门村,沙湾村,程桥村,姚畈社区,店上村,上坑源林场,溪源社区,南门社区,朱家坪社区,城南社区,楼前山社区,永红村,长岭村,前何村,后何村,河埠村,牌坊村,新圳村,九街村,西湾村,山头村,湖尾村,东升村,甘家村,新村村,园艺场,安居村,熊家村,花门村,中洲村,江坊村,小埠村,洪贤村,园艺场,郭坪村,湖坊村,大岭峰林管站,丰塘村,甘泉洲分场,湖家潭分场,三岔分场,箭头分场,关口村,锞岭村,纪庄村,水产场,新村村,高家村,店上村,子溪村,牛皮山村,蔡畲村,三文塘村,方家洲村";
    private final static String source = "农科新社区居民委员会,石门街镇南门村,珠湖乡荣七村,峡山林场合港村,清湖乡湖琳村,汪二镇林场,抱坞亭村民委员会,杨柳村民委员会,大尖山社区居民委员会,甲路村委会,方村村委会,莲花山乡国营林场,莲湖乡表恩村,古埠镇黄岗村,鹭鸶港乡何埠村,洪家嘴乡金滩村,红桥垦殖场练家分场,董团村,双桥村民委员会,水绿桥社区居民委员会,梓埠镇五一村,裴梅镇东源村,古县渡镇桐湖村,古县渡镇三源村,枫港乡大屋村,梅港乡坂二村,湾里乡庙前村,莲荷乡黄藤村,东坑村,黄岭村,县林科所,密川村民委员会,梓埠镇共和村,石门街镇新石村,古县渡镇汪家村,银宝湖乡青林村,瑞洪镇把山村,紫源村与沽溪村争议,岭头山村村民委员会,泉波村民委员会,泉岭村民委员会,炉里村民委员会,理坑村委会,董家村委会,齐埠乡盘田村,梓埠镇古城村,双港镇荆华村,梅港乡三异村,洪家嘴乡塔前村,下坛村民委员会,石人村,红山社区居民委员会,大茅山基建队社区居民委员会,排前村委会,莲花芯居委会,银宝湖乡银宝村,三塘乡大口村,墩头村民委员会,牛山林场,红区林场,路底村民委员会,康山乡金山村,湾里乡广兴村,河口镇林场,新滩乡九狮村,毛塘村民委员会,苏村村民委员会,新营三居民委员会,秋口林场,石镇镇双山村,金盘岭镇驿金村,双港镇团结村,双港镇斗牛山水产场,莲湖居民委员会,王坑村民委员会,军潭水库,灵溪村民委员会,古县渡镇罗井村,古县渡镇建阳村与张家岭村争议,珠湖乡同兴村,玉亭镇德胜村,汪二镇漕源村,赛头社区居民委员会,湖云乡西湾村,古县渡镇马赵村,饶埠镇畲埠村,玉亭镇石山村,漆工镇余仓村,四十里街镇湖东村,田畈街镇牌楼分场,白马桥乡程家村,岑阳镇人民政府,永平镇河背村与林家村共有,鹅湖镇闪石村,联星村,金钟山村,里村村委会,凰岗镇江叶村与西山村争议,枫港乡岭上村,古埠镇后港村,瑞洪镇新塘村,港边乡何家村,王石村民委员会,舒村村民委员会,青山村,大塘角社区居民委员会,邵新村民委员会,张家村民委员会与於里村民委员会争议,四十里街镇董林村,乐丰镇火把村,柘港乡桂林村,昌洲乡南林村,朱坑镇西童村,黄石村,塘湾村民委员会,周家山村委会,田畈街镇高家村,大溪乡八圩村,梅港乡三联村,洪家嘴乡沿港村,新村村与紫源村争议,戴家村委会,花园村委会,秋溪村委会,中云村与横槎村争议,双港镇余沈村,瑞洪镇谢家村,九龙镇湖西村,江埠乡大港村,梅港乡蛟龙村,流源村,焦坑村民委员会,向阳村委会,齐埠乡塘背村,莲湖乡三汲坊村,玉亭镇宝珠村,白马桥乡凤凰村,佛母村,桐坞村,四十八镇林场,畈上村民委员会,古埠镇蔡坊村,瑞洪镇仓前村,青板乡人民政府,永平镇北门村,下坊村民委员会,十七都村民委员会,凤仪门社区居民委员会,西冲林场,上坊乡富厂村,上坊乡港边村,饶埠镇饶埠社区,石口镇常山村,曹溪镇芳湖村,弋江镇人民政府,湖坊镇中李村,马眼水库,儒坞村,深坑村民委员会,莒君村委会,苏桥乡杨芳村,鄱阳镇江家岭村与任家山村争议,饶州监狱9队,黄金埠镇前进村,漆工镇赖家村,湾里乡湖桥村,虹桥乡王畈村,永平镇永平村,大洋村民委员会,玉山县六都乡,龙泉村民委员会,瓦源村民委员会,裴梅镇江源村,珠田乡坪上村,双港镇尧丰村,古县渡镇罗龙村,珠湖乡东红村,中畈乡下范村,三亩村村民委员会,大茅山集团公司金山金矿,水岚村委会,庆源村委会,西垣村与裔村村争议,岭脚村委会,山溪林场,河口镇韩家村,地区林科所,三庙前乡布袋村,三塘乡联兴村,洪家嘴乡严溪村,白马桥乡毛坊村,洪家嘴乡黄岗村,漆工镇西坑村,湖云乡邱夏村,裴梅镇塘边村,高家岭镇韩山村,银宝湖乡鸣山村,洪家嘴乡和爱村,樟树墩镇大港村,兰田村民委员会,塘边村民委员会,宋宅村民委员会,葛源镇黄溪村,港边乡港边村,永平镇横溪村,毛家垄村民委员会,墩头村,东升林场,大畈村委会,汪家乡万和村,侯家岗乡茶塘村,三庙前乡大利村,社赓乡枧头村,后田村,大石头村民委员会,玉山县文成镇涨畈村,小沱村委会,河东村与小沱村争议,历居分场,金盘岭镇分水岭村,三庙前乡东朋村,鹭鸶港乡大沙湖村,毛楼村,英塘村民委员会,港口镇东源村,清湖乡虎山村,河口镇玉石村,下喻村民委员会,高潭村,冷水村,洪坦村委会,婺源县国营鄣公山综合垦殖场,杨埠镇寨源村,瑞洪镇下西源村,曹溪镇马山村,司铺乡牛桥村,石塘镇港背村,土城村民委员会,上饶县五府山镇塘里村,青石村民委员会,德兴市畜牧良种场,大潋村委会,石门街镇铁门村,田畈街镇叶门村,瑞洪镇东三村,古埠镇纪庄村,彭宅村,双溪村,大石街道办事处,圭峰镇水保镇,湾里乡人民政府,稼轩乡湖村畈村,葛仙山镇高际村,舒家棚社区居民委员会,江口村民委员会,黄柏乡长田村民委员会与万村乡新屋村民委员会争议地,游城乡北塘村,杨埠镇高家村,汪二镇杨箭村,玉田村民委员会,乐平市,潭兴社区居民委员会,苏桥乡烧桥村,田畈街镇韶田村,乐丰镇桐山村,三塘乡蔡垄村,前洋村民委员会,社赓乡三文塘村,永平镇花亭子村,太源乡马鞍村,枫林社区居民委员会,高洲村,牌门村民委员会,汪槎村与庆源村争议,长降林场,古县渡镇段坂村,游城乡板埠桥村,鹅湖镇青洲村,张家村民委员会,玉亭镇百湖村,鹅湖镇傍罗村,汪二镇下四村,田畈村民委员会,齐埠乡水产场,梓埠镇道港村,陈营镇黄营村,青云镇乐华村,社赓乡折都村,兴安街道办事处直属,武夷山镇农科所,西山村民委员会,皇珠村民委员会,碧霞村,茅村分场,万年县人民政府,油墩街镇莲东村,游城乡南源村,圭峰镇流口村,姚家乡兰子村,武夷山镇沙畈分场,江家村,富山村民委员会,福建省南平市浦城县九牧镇,盘石村民委员会,仁洪村委会,水埠头村委会,大源镇石下村,瑞洪镇东二村,瑞洪镇江三村,虹桥乡虹桥村,霍村村民委员会,武夷山镇西坑分场,花厅镇乡林场,毛湾村,枫林村,石山村民委员会,胜利村民委员会,齐埠乡松竹村,白马桥乡山源村,王村畈村民委员会,大地村,立新村民委员会,古坦村委会,裴梅镇彭家村,乐丰镇鱼龙泉村,三庙前乡渡头村,古埠镇南岗村,莲荷乡莲荷村,河口镇汭口村,永平镇安洲村,篁碧乡大岩村,紫湖村民委员会,昆山社区居民委员会,万年县城区,凰岗镇詹家墩村,鹅湖镇钟家村,东门社区居民委员会,太平村民委员会,仙山村,何家村,溪滩村民委员会,五星居民委员会,汪杨社区居民委员会,桃溪村委会,湖云乡吾峰村,湖云乡栎山村,上坊乡程源村,叠山镇周潭村,卢家村与坑口村争议,胡村村民委员会,荸荠塘村,田畈街镇韶田村与高家村争议,团林乡建设村,芦田乡洪源村,洪家嘴乡双港村,杨埠镇牌坊村,鹭鸶港乡前徐村,银山社区居民委员会,梓埠镇园艺场,樟树墩镇樟树墩村,朱坑镇毛家村,永平镇杨家桥村,鹅湖镇石溪村,少阳村民委员会,四都村民委员会,桑园村民委员会,仑溪村民委员会,窑山村民委员会,庙林村民委员会,蔡村村民委员会,双溪居民委员会,四十里街镇范家岭林场,三庙前乡埠丰村,三庙前乡水产场,玉亭镇南关村,中畈乡溪湾村,鹅湖镇后田村,鹅湖镇石桥村,东巷村民委员会,中店村民委员会,杨宅村民委员会,岭底村民委员会,前段村委会,梓埠镇周湾村,鄱阳镇居委会,谢家滩镇胡墩新村,侯家岗乡新岗村,大溪乡杨源村,石口镇五菱村,临江湖社区居民委员会,鄣山村委会,浯村村委会,曹门村委会,凰岗镇宝应林场,柘港乡潼丰村,芦田乡吴张村,洪家嘴乡埂上村,岩瑞镇东垄水库,毛源村,乌岩村民委员会,横峰县,海口镇黄渡村,中洲林场,裴梅镇黄墩村,金盘岭镇铺前村,饶埠镇张家村,铁山村民委员会,枫港乡南坪村,东塘乡东河村,永平镇下畈村,湖坊镇河东村,永乐村,小康城社区居民委员会,幸福社区居民委员会,太白镇玉坦村与紫阳镇坑口村争议,高家岭镇大塘村,珠湖乡华龙村,黄金埠镇五雷村,安坑村,关里水库管理局,塘头村民委员会,新屋村民委员会,梅林村委会,薛村村委会,上坊乡夏营村,司铺乡古楼村,鹅湖镇河口电站,葛仙山镇项源村,新滩乡清流村,永久村民委员会,桥村社区居民委员会,交溪村民委员会,上饶县花厅镇,昭林村民委员会,汾水村委会,鄱阳镇岭曹村,石门街镇东山垄村,团林乡团林村,农科所石林村,枫港乡李湾村,鹅湖镇蔡家村,大济村,石狮村,刘家坞与十里争议地,洪家嘴乡双塘村,三塘乡三畈村,茗坑村民委员会,桥下社区,舒弄村,溪北村,溪边村民委员会,信州区沙溪镇向阳村,舒湾村民委员会,石镇镇虎山村,油墩街镇油墩街社区,高家岭镇董红村与芦埠村争议,梅港乡早里源村,南岩镇栗桥村,王村分场与坪阳分场争议,虹桥乡江家村,毛宅村民委员会,高门村,陈坊村民委员会,沱口村与凤山村争议,枫港乡枫港村,信丰垦殖场枫林湾村,篁碧采育林场,塔山村民委员会,七星村民委员会,茅家岭村民委员会与同心村民委员会争议,青岩村民委员会,藏坑村委会,冲田村委会,梓埠镇渡港村,石镇镇石镇村,苏桥乡虞坊村,油墩街镇长丰村,大葛村民委员会,小东坞村,王家坞村民委员会,银峰村民委员会,古县渡镇南桥村,饶丰镇蔡家湾村,中畈乡汗墩村,曹溪镇程坂村,新滩乡江家村,大园地村民委员会,东园村委会,油墩街镇楼下村,田畈街镇一分场,凰岗镇江叶村,游城乡半港村,大溪乡大溪村,畜牧良种场,北山村,古埠镇上湾村,石口镇南源村,姚家乡琯山村,新滩乡占村村,县后山村民委员会,大西坑村民委员会,中村村民委员会,大源镇南畈村,三塘乡腾溪村,九龙镇龙塘村,社赓乡横岗村,瑞洪镇上西源村,圭峰镇人民政府,武夷山镇石垄分场,宋家村民委员会,浮溪村委会,四十里街镇良种场,枧田街乡大源水库,瑞洪镇梁山村,余佛村民委员会,清溪村民委员会,汪宅村,晓镛村委会,龙山村委会,黄金埠镇菱塘村,鹅湖镇鹅湖村,茹茅村民委员会,道堂社区居民委员会,祝家墩社区居民委员会,坑东村民委员会,东瓦窑村民委员会,黄柏乡炉湾村民委员会,钟吕村委会,四十里街镇四十里街水产场,芦田乡应家村,三塘乡榨下村,桐子岭水库与河东村争议,杨家村民委员会,新源社区居民委员会,对坞村委会,青云镇史桥村,田畈街镇徐塘村,饶埠镇湾埠村,姚家乡后占村,姜宅居民委员会,百果村民委员会,甘溪村,庐坑岭村委会,青云镇姚源村,谢家滩镇福山村,昌洲乡北富村,社赓乡李塘村,葛溪乡马鞍村,项源村与排山村争议,麦埂坞村,西坛社区居民委员会,湖丰社区居民委员会,社后村民委员会,大茅山集团花桥实业公司与昭林村民委员会争议地,吴源村委会,响水滩乡潭家村,莲湖乡大霞村,黄金埠镇曾家畈村,永平镇八水源村,流源村民委员会,向阳村民委员会,新滩乡李叶村,水晶山林场,杉树村,坂头居委会,翁岭村民委员会,公堂村民委员会,汪家乡新乐村,大溪乡大岭峰林管站,湖坊镇吴家村,紫溪乡火星村,官溪社区居民委员会,田里村,象山村,罗桥居委会,交溪林场,中潭村民委员会,西坑村民委员会,西冲村委会,婺源县珍珠山生态林场,石镇镇射田村,四十里街镇太平村,凰岗镇观前村,狮山居民委员会,古县渡镇南滨村,柘港乡莲南村,社赓乡方凡村,康山乡府前村,中畈乡显南村,战畈村民委员会,桃源村和阆山村争议,裔村村与宫坑村争议,石镇镇黄柏村,侯家岗乡炉下村,银宝湖乡和平村,团林乡铜钱村,丰源社区居民委员会,三庙前乡吉潭村,莲湖乡向阳村,三塘乡石柱村,王家店村,中坂村,花厅村,油墩街镇高田村,白马桥乡安居村,鹭鸶港乡雷溪渡村,叠山镇人民政府,港口镇上坊村,永平镇水泥厂,舵阳村民委员会,鹅湖镇洋洲村,汪二垦殖场,葛仙山镇斜岭村,天柱山乡港口村,塘西村民委员会,车边村,横港村民委员会,新建村民委员会,梨园社区居民委员会,古县渡镇华山村,珠湖乡丰塘村,莲湖乡孙坊村,九龙镇西湾村,港边乡灵西村,汪二镇洲上村,蔡家村,五村村,黄狮村民委员会,雍溪村委会,凰岗镇西山村,凰岗镇程家村,莲湖乡年丰村,芦田乡孤山村,江埠乡石溪村,三塘乡后湖村,石塘镇十都村,蒋家山村民委员会,白塔村,荷坞村民委员会,郭门居民委员会,杜村村民委员会,婺源县国营珍珠山综合垦殖场,洪家嘴乡东升村,洪家嘴乡富湾村,龙琴社区居民委员会,新康村民委员会,上镇村,赋春镇虎溪村与镇头镇镇头村争议,高家岭镇内湖村,饶埠镇舒埠村,枧田街乡团群村,枫港乡禾山村,白马桥乡子溪村,里洋村民委员会,湾里乡官源村,稼轩乡山头村,英将乡焦坑村,太甲村民委员会,壶峤镇,余坡塭村民委员会,天舍茶场,石门街镇汉桥村,四十里街镇唐湖村,田畈街镇黄岭村与徐塘村争议,港边乡余塘村,青板乡薛家村,上饶县董团乡联胜村,岭下村,管村村民委员会,大茅山集团铁罗山实业公司,占才村委会,言坑村委会,柘港乡莲麓村,峡山林场坂桥村,港口镇錾山村,花亭综合垦殖场花亭村,塘溪社区居民委员会,白石源村委会,霞港村委会,梓埠镇余芦村,乐丰镇新岭口村,农科所滨田村,南阳村民委员会,塘尾村民委员会,浮墩村,七峰村,紫坞村民委员会,上饶县花厅镇白塔村,日升村民委员会,西垣村委会,东岭坞村与上梅洲村争议,田畈街镇发扬村,凰岗镇杨源村,凰岗镇九井村,昌洲乡小渡村,石口镇古竹村,泉眼村民委员会,大丰源林场,乐平市飞地,凰岗镇凰岗村,双港镇乐亭村,柘港乡莲港村,黄金埠镇团湖村,黄金埠镇长山村,三县岭综合垦殖场龙家村,湾村村民委员会,玉峰村民委员会,枫叶村民委员会,高洋村,前坦村委会,乐丰镇南山村,饶埠镇六塘村,饶州街道办事处居委会,洪家嘴乡万谭村,九龙镇大田村,乌泥镇铜鼓包村,溪西村民委员会,铜坑村民委员会,莲鼓村民委员会,石镇镇大黄村,青云镇青云村,田畈街镇滩口村,田畈街镇长方村,响水滩乡塘下村,瑞洪镇江一村,九狮畲族村,古埠镇四一村,葛源镇槎源村,竹枧村民委员会,广平村民委员会,恩山村,周村村,金盘岭镇桂花村,双港镇高家岭村,侯家岗乡大溪村,三塘乡新桥村,枫港乡阮家村,青板乡霞阳村,岭山村民委员会,中坛村民委员会,周墩村,上饶县花厅镇中畈村,东风村民委员会,梓埠镇后张村,陈营镇永乐村,游城乡刘家村,三庙前乡东高村,莲湖乡蒋坊村,杨埠镇塔尾村,黄茅坞村民委员会,碓头村民委员会,潭头村民委员会,溪淤村民委员会,彩虹桥居民委员会,梓埠镇李家村,油墩街镇徐家村,双港镇聂家村,侯家岗乡侯岗村,响水滩乡牌港村,饶州监狱6队,枫港乡郭坪村,红门村,三官殿社区居民委员会,竹岩村民委员会,梓埠镇白竹村,双港镇长山村,枧田街乡枧田村,三庙前乡林场,玉亭镇锞岭村,鹭鸶港乡茶林村,天柱山乡檀合村,龙溪村民委员会,岩坑村民委员会,新营二居民委员会,杨村村委会,九龙镇燕湖村,江埠乡花门村,梅港乡赤岭村,古埠镇禁山村,车头村民委员会,高砂村委会,西山村与通源村争议,晓起村委会,洪村村委会,四十里街镇新路村,金盘岭镇上兰村,饶埠镇龙西村,游城乡黄村村,九龙镇新圳村,江埠乡人民政府,毛棚村,尚和村民委员会,严田村委会,珠湖乡群联村,团林乡汪洋村,玉亭镇周家村,枫港乡傅家弄村,大溪村,古城村民委员会,石口镇湖滨村,曹溪镇刘家村,永平镇陈家寨村,鹅湖镇江村村,虹桥乡窑山村,库前村,江湾林场,溪头乡西岸村与段莘乡阆山村争议,凤山村委会,昌洲乡北兴村,饶州监狱珠湖农场,鹭鸶港乡三湖村,上铺村民委员会,路源村民委员会,聚远社区居民委员会,中云村与霞港村争议,苏桥乡夹罗村,田畈街镇松山村,古县渡镇蜈蚣村,银宝湖乡水产场,武夷山镇王村分场,毛家社区居民委员会,东坞村,古村村民委员会,张墩头林场,绕二村民委员会,东岭坞村委会,婺源县小港村与德兴市争议,谢家滩镇义门村,江埠乡园艺场,陈坊乡翁溪村,沙畈分场与里洋村争议,体泉村民委员会,西源村委会,裴梅镇葛毛坞村,油墩街镇龙尾村,古埠镇宁岗村,樟树墩镇火桥村,武夷山镇篁村分场,包溪村民委员会,小源村,祝家社区居民委员会,苏桥乡吴林村,青云镇古阳村,谢家滩镇大岩村,凰岗镇金鸡村,古县渡镇张家岭村,白沙洲乡礼恭脑村,昌洲乡北旺村,弋江镇蔬菜村,东山头村民委员会,黄家山村民委员会,傅家墩村民委员会,枧田街乡闵桥村,枫港乡河源村,漆工镇杨桥村,漆工镇洋泥畈村,叠山镇翁家村,叠山镇慈竹村,圭峰镇宝石村,铅山建材厂,大玉村民委员会,溪山社区居民委员会,吉塘村民委员会,东石村与汪槎村争议,岩前村委会,油墩街镇柘下村与西湖,凰岗镇林桥村,乐丰镇十字河口村,滨田水管局,白马桥乡店上村,黄金埠镇绿源村,瑞洪镇罗家村,永平镇中心小学,思口村委会,小沱林场,鄱阳镇芝田村,鄱阳镇风雨山村,双港镇荆塘村,枧田街乡大源村与枧田村争议,湖坊镇虎眼坪分场,姚山村,朱坞村民委员会,鸦鹊湖乡下岸村,鸦鹊湖乡新建村,黄金埠镇上洪村,瑞洪镇神口村,永平镇五都村,鹅湖镇前进村,石镇镇桐源村,双港镇花园里村,芦田乡坽口村,葛溪乡王家村,姚家乡百家村,永平镇林场,天柱山乡新村村,桐西分场,波阳村,词坑村委会,古县渡镇泥滩村,枫港乡迁移村,枫港乡西坪村,石塘镇石塘村,鹅湖镇下古埠村,前山村,南墩村民委员会,青云镇乐源村,谢家滩镇杨塘村,凰岗镇章刘村,响水滩乡英豪村,莲湖乡下岸村,贵溪市,川桥村民委员会,源塘村,清塘村民委员会,新岗山社区居民委员会,里村村与大鄣山乡车田村争议,横槎村委会,金盘岭镇驿田村,古县渡镇高源村,黄金埠镇高峰村,梅港乡寨上村,葛溪乡葛溪村,朱坑镇塘坪村,葛源镇葛源村,栗木坑村委会,盘山村委会,鄱阳镇任家村,莲湖乡南培村,芦田乡芦田村,石塘镇十一都村,六亩居民委员会,坑口村,郑坊村,洙西村委会,苏桥乡畈民村,谢家滩镇大田村,柘港乡垅里村,三塘乡畈程村,乌泥镇港背村,葛仙山镇陈家坞村,稼轩乡轸源村,红旗林场,王家墩村委会,沱口村委会,上坊乡细港村,双港镇双港村,三庙前乡樟潭村,大溪乡闵坊村,古埠镇联合村,圭峰镇大塘村,葛仙山镇杨村村,上泸村,西溪社区居民委员会,丁村村民委员会,响水滩乡河北村,江埠乡江坊村,杨埠镇汤源村,杨埠镇箬源村,康山乡山头村,金坪村民委员会,梨园村民委员会,何村村,排山社区居民委员会,东山村民委员会,洪家嘴乡雷湾村,石口镇刘埠村,汪二镇石垄村,葛仙山镇大田村,英将乡小横村,广丰区,乐安社区居民委员会,赋春村委会,上梅洲村委会,三庙前乡横坽村,莲湖乡莲青村,南岩镇人民政府,岑阳镇朝堂村,汪二镇徐家村,革坂分场,沙洲林场,江湾镇钟吕村与浙江省争议,乡农科所,昌洲乡凤嘴村,康山乡大山村,汪二镇汪二村,定湖村民委员会,杨桥村,沙溪镇苗圃,青金村民委员会,清华村委会,青石村委会,漆工镇烈桥村,漕源村与荷田村争议,紫溪乡红星村,霞峰镇,诗春村委会,湖云乡白马村,三庙前乡东朗村,江埠乡小埠村,玉亭镇劳动村,古埠镇古埠街社区,解放居民委员会,中畈乡芳墩村,朱坑镇上童村,莲荷乡九甲村,白桥村民委员会,十里山居民委员会,廖家村,大鄣山乡水岚村与景德镇市争议,古县渡镇邓坂村,饶埠镇同德村,昌洲乡北丰村,三庙前乡马墩村,芦田乡金源村,周田村民委员会,社赓乡花墩村,石口镇永安社区,篁碧乡东山村,上坂村民委员会,双溪口村村民委员会,湖丰蚕场,洪源下村委会,水电站,四十里街镇农科所,高家岭镇董红村,响水滩乡河西村,银宝湖乡民主村,大阳亭村民委员会,湖边社区居民委员会,前村村民委员会,珠湖乡周家村,芦田乡大吉村,稼轩乡八都村,周溪村民委员会,中魏村,广丰区人民政府,董家山分场,中云村委会,古县渡镇古北村,侯家岗乡畈上村,三塘乡桥头村,白马桥乡湖溪村,洪家嘴乡凤颈村,葛源镇关田村,七里街社区居民委员会,五里洋村民委员会,三都茶场,瑞港村民委员会,镇头村委会,齐埠乡方家村,田畈街镇港北村,侯家岗乡高沙村,珠湖乡三门村,望仙村,葛源镇石桥村,藻溪村民委员会,井边村,湖村村,三连坑村,荷叶村,菊径村委会,江埠乡山里村,洪家嘴乡中埂村,汪二镇火田村,上乐村,大丰林场,沽塘居民委员会,何家村民委员会,共大梓木坑村,谢家滩镇谢家滩居委会,社赓乡涂家村,葛溪乡李畈村,葛源镇枫林村,河口镇原种场,湖山村,齐村村委会,田畈街镇金竹村,玉亭镇牌岗村,清湖乡清湖村,英将乡垄西村,东山分场,大茅山集团金山林场,中村村与金坑村争议,湖云乡刘夏村,谢家滩镇桥头村,芦田乡舍头村,古埠镇枫塘村,三十八都村民委员会,漆工镇人民政府,鹅湖镇塘尾村,下四村与杨箭村争议,陈坊乡沽溪村,四公村民委员会,源溪社区居民委员会,清湖乡人民政府,紫溪乡紫溪村,淤里村民委员会,坳村村民委员会,清水村,西坑林场,柴九洋村民委员会,油墩街镇桥头村,双港镇尧山村,古县渡镇红岭村,昌洲乡董坪村,江埠乡龟山村,河口镇高岭村,生姜村民委员会,营盘村民委员会,彭家坞村,婺源县,三塘乡上曹村,三塘乡洪埠村,石口镇后何村,姚家乡七甲村,樟村社区居民委员会,苏桥乡杨桥村,油墩街镇获溪村,饶埠镇畈徐村,梅港乡蒋坊村,汪二镇荷田村,新滩乡后畈村,玉山县人民政府,曾家村民委员会,毛村村民委员会,十里村民委员会,洎水社区居民委员会,肯堂山社区居民委员会,园林社区居民委员会,胡家村民委员会,秀水村委会,石门街镇洪林山林场,汪二镇长山分场,塘墀社区居民委员会,朱狮村民委员会,田青铺村民委员会,饶丰镇汪家圩村,枧田街乡茅岭村,游城乡周家村,白马桥乡古塘村,杨埠镇甘泉村,铅山共大,四十里街镇徐步村,洪家嘴乡团林村,莲荷乡丁家村,河东村与河西村争议,上饶县人民政府,周坞村,下余村民委员会,渔塘村民委员会,通元村委会,梓埠镇河东村,汪家乡昌港村,饶埠镇户外村,游城乡游城村,梅港乡库管村,河口镇清湖村,邱家居民委员会,青边村民委员会,香屯街道办事处,江田村民委员会,黄柏乡五七分场,上溪村委会,四十里街镇华岭村,东田村,上饶县花厅镇周村村,湖云乡标林村,裴梅镇大河分场,莲湖乡爱民村,枫港乡王家村,江埠乡陈坪村,古埠镇太和村,杨埠镇占坊村,南岩镇叶坝村,河口镇民和村,仙洲村民委员会,汪村村民委员会,大鄣山乡鄣山村与沱川乡溪头村争议,大汜村委会,苏桥乡麻畲村,双港镇三汊村,饶丰镇花园村,三庙前乡青泥村,漆工镇黄家源村,开化县,昆山村,茗洋村,长溪村委会,占才村与言坑村争议,长滩村委会,大源镇山背村,谢家滩镇莽塘村,饶州街道办事处黄家洲村,黄金埠镇边山村,司铺乡人民政府,革坂村,双源村,塔水村民委员会,茅家岭村民委员会,游汀村委会,叠山镇双港村,葛源镇上坑源林场,河口镇虞家村,河口镇鱼种场,梓埠镇椒源村,田畈街镇松林村,双港镇彭家村,响水滩乡铁炉铺村,珠湖乡群众村,瑞洪镇后山村,葛溪乡田东村,葛溪乡湖西村,桥町坞村民委员会,应家村,松林村民委员会,建成区,西坑村委会,上坊乡上坊村,高家岭镇汪玲村,都昌县,梅港乡王化村,中畈乡下叶村,汪二镇彭桥村,宅前村民委员会,清溪桥村民委员会,86466部队,泉塘村,西山村,香屯居民委员会,槎口村委会,汪家乡新建村,瑞洪镇西岗村,新滩乡湖塘村,中洲村民委员会,古蜀地村委会,鸦鹊湖乡水产场,团林乡江山村与藕塘村争议,三庙前乡东阳村,圭峰镇蒋坊村,丰溪街道办事处,廿四都社区居民委员会,沙田村民委员会,东头村委会,朗湖村委会,双港镇荆塘村与荆华村争议,游城乡淮王坦村,三塘乡三塘村,新村村与南湖村争议,卓家村民委员会,徐坞村,岁寒山社区居民委员会,昄大村民委员会,戴村村委会,秋口村委会,城口村委会,枧田街乡沙堤村,瑞洪镇后沿村,鹭鸶港乡汤村村,中畈乡陈塘村,岑阳镇蔡坞村,湖坊镇沙溪村,包家村,汪口村委会,陈营镇珠山村,天柱山乡高泉村,古山村民委员会,吉安村,项家村民委员会,吴村社区居民委员会,银城街道办天门山村,裴梅镇龙港村,部队,谢家滩镇大畈村,凰岗镇溪口村,凰岗镇滩头村,上饶县田墩镇湖潭村,侯家岗乡寺前村,游城乡鱼塘村,白马桥乡港边村,瑞洪镇前进村,河口镇农科所,太源乡西坑村,石镇镇板舒村,陈营镇马家村,鹭鸶港乡李家渡村,康山垦殖场里溪村,紫溪乡柏畈村,横街社区居民委员会,水阁社区居民委员会,渡头村民委员会,长田村民委员会,上溪村与青石村争议,游山村委会,齐埠乡江家村,青云镇东南村,苏桥乡垱下村,鄱阳镇桂湖村,龙门畈乡人民政府,虹桥乡飞蛾村,新滩乡西畈村,前坊村,新营一居民委员会,金家社区居民委员会,西山村委会,饶州监狱11队,黄金埠镇白云村,铅山县,郑村坞村民委员会,鸿坛村民委员会,葛仙山镇邓村村,森源村与莲塘村争议,金交社区居民委员会,石咀村,汪岭村,洲头社区居民委员会,重溪村民委员会,苏桥乡射林村,饶州街道办事处杨梅桥村,团林乡清泉村,莲湖乡幕礼村,古埠镇蒋家村,古埠镇古埠村,杨埠镇柴店村,古埠镇五福村,田墩居委会,坞垄村民委员会,大鄣山乡程村村与浮梁县争议,香田村委会,凰岗镇东源村,双港镇官田里村,莲湖乡水产场,九龙镇润溪村,太源垦殖场与佛寨村争议\uE5C5,万花村民委员会,江埠乡中洲村,古埠镇张扬村,石口镇占家村,三县岭综合垦殖场沙湾村,湖坊镇上港村,上饶县董团乡大地村,油榨村民委员会,田畈街镇东湖村,金盘岭镇粑茅岭林场,枫港乡涂坊村,姚家乡建作村,南源村民委员会,下裴村,船坑畲族村,王家坝村,鲍坞村民委员会,官桥村委会,思溪村委会,田畈街镇新畈村,鸦鹊湖乡大牛湖分场,石门街镇徐墩村与新村村争议,弋阳县人民政府,朱坑镇米岭村,鹅湖镇孔家村,新滩乡庙湾村,潭埠村民委员会,文港村民委员会,三庙前乡龙丰村,虹桥乡森源村,周山村民委员会,紫湖镇大叶林场,旭日社区,黄家淤村民委员会,大茅山集团花桥实业公司,茶林场,齐埠乡五里长山垦殖场,田畈街镇新联村,双港镇双桥村,乐丰镇塘头村,游城乡朗埠村,杨埠镇濠源村,港口镇园竹村,花棚村民委员会,方村村民委员会,店前村民委员会,青云镇张家山水库,上坊乡湾里村,饶丰镇灌塘村,团林乡板塘村,大溪乡汪塘村,鹅湖镇农科所,汪二镇下程村,雁门村民委员会,周家坞村民委员会,龙潭村民委员会,下湖村民委员会,大茅山集团公司绕二实业公司,三庙前乡洪曹村,莲湖乡刘家村,瑞洪镇前沿村,白马桥乡寺前村,洪家嘴乡何家村,油麻坞村民委员会,丁洲村民委员会,东塘乡新村村,花亭综合垦殖场,湖坊镇桐子岭,吴家社区居民委员会,金鸡村,东塘村民委员会,梓埠镇下埠农场,陈营镇邹坂村,鄱阳镇邓家村,谢家滩镇泥湾村,油墩街镇东山村,油墩街镇莲西村,赤塘村民委员会,碧石村民委员会,双港镇双港镇水产场,永平苗圃,天柱山乡方家岭林场,六村村民委员会,白泥村民委员会,山头村民委员会,大茅山集团龙头山实业公司,裴梅镇富林村,田畈街镇永滩村,昌洲乡南湖村,汪二镇油料厂,后垄村民委员会,大坂村,祝狮村,徐墩林场,毛坞垅林场,黄柏乡港西村民委员会与万村乡新屋村民委员会争议地,龙头村民委员会,田畈街镇小港村,柘港乡横溪村,鸦鹊湖乡春前分场,团林乡林牧场,玉坑村村民委员会,双龙村,五里社区居民委员会,沙溪村民委员会,三庙前乡高峰村,中畈乡杉山村,曹溪镇横桥村,曹溪镇外洪村,葛仙山镇尤源村,新塘村民委员会,界田村民委员会,社赓乡丰塘村,圭峰镇邹山村,龙门畈乡宜兴村,溪北村民委员会,詹家村,文家居委会,陈营镇聂家村,圭峰镇罗家村,陈坊乡荆林村,八磜村村民委员会,宗儒村民委员会,苏桥乡苏桥村,石门街镇石门村,四十里街镇大坂村,常山县,三都村民委员会,古城社区居民委员会,同心居民委员会,紫阳镇马家村与蚺城街道城关村争议,汪家乡坑边村,古县渡镇建阳村与郑家村争议,侯家岗乡共大与太平坦村争议,白马桥乡潼口村,中畈乡江辽村,上饶县董团乡红石村,石峡村,百花村民委员会,东阳村民委员会,渔潭村委会,齐埠乡星明村,洪家嘴乡龙津村,石口镇东湾村,中畈乡乌垄村,中畈乡中畈村,新滩乡下徐村,塘顶村民委员会,青山坝村民委员会,八都村,后溪村民委员会,银泉社区居民委员会,赋春镇长溪村与大障山乡戴村村争议,凰岗镇农场,莲湖乡茭溪村,洪家嘴乡高坑村,杨埠镇坪上村,梅港乡大山村,青板乡金鸡村,天柱山乡浆源村,纱帽村民委员会,四十里街镇国安村,田畈街镇碧山村,饶丰镇高溪村,侯家岗乡横河村,葛源镇山黄林场,大举村民委员会,赵塘村民委员会,余村村民委员会,武安路社区居民委员会,古县渡镇石上村,古县渡镇郑家村,昌洲乡陈高村,九龙镇民安村,黄金埠镇梅岭村,家潭村民委员会,东塘乡新建村,院边村民委员会,八仙洞村村民委员会,西湖村,黄源村,源溪村,杨坑村委会,油墩街镇乾湾村,珠湖乡同兴村与华龙村争议,岑阳镇姜家村,月塘村与月桥村争议,武夷山镇岑源分场,横溪社区居民委员会,苏家村,苗山村民委员会,海口村民委员会,苏桥乡合田村,田畈街镇桃溪村,白沙洲乡车门村,团林乡藕塘村,洪家嘴乡柳林村,紫云村,港口镇仙台村,稼轩乡西洋村,太源垦殖场,太源乡太源村,王坊村民委员会,黄沙村,张家畈社区居民委员会,黄柏村民委员会,太白村委会,珠田乡丰林村,陈营镇余源村,凰岗镇清塘村,条铺林场,长寿村与弋阳县争议,陇首村民委员会,铁山村,常埠村,大塘底村民委员会,双峰村民委员会,侯家岗乡移民林场,鸦鹊湖乡高家圩村,江埠乡山背村,朱坑镇潭石村,龙门畈乡土岩村,莲荷乡人民政府,济溪村委会,晓容林场,古县渡镇南庄村,侯家岗乡大塘铺村,九龙镇徐家村,梅港乡黄芽村,徐家村,民主居民委员会,何家村民委员会与东风村民委员会争议,古埠镇水产场,港边乡人民政府,石塘镇彭村村,下濂溪村民委员会,前坞村民委员会,永丰村,齐埠乡上汪村,油墩街镇漳溪村,侯家岗乡新村村,莲湖乡塔李村,黄金埠镇上行村,黄金埠镇四合村,振华居委会,下山居委会,三塘乡湖尾村,洪家嘴乡红莲村,南岩镇南岩村,朱坑镇人民政府,横峰县人民政府,方塘村村民委员会,西岸村委会,张村村委会,湖云乡水产场,石镇镇井路村,朱坑镇下琬村,岑阳镇黄家村,英将乡留桥村,英将村与留桥村争议,石牌村民委员会,杨村村民委员会,浙江省开化县,白石村委会,河西村委会,洙坑村委会,鄱阳镇江家岭村,江埠乡洪贤村,东塘乡东方村,上饶县茶亭镇前坊村,桥头村民委员会,十都村民委员会,朱家坪社区一居民委员会,裴梅镇大港桥水库管理局,古县渡镇建阳村,鹭鸶港乡上兴村,樟树墩镇人民政府,旗山分场,青板乡徐村,汪二镇丰产水库,金溪社区居民委员会,富家坞社区居民委员会,高家岭镇积谷村,九龙镇九街村,葛溪乡雷兰村,和平村民委员会,青云镇下湾村,谢家滩镇芦林村,石门街镇枫术村,枧田街乡珠田村,三塘乡上谭村,大塘乡胜利村,莲荷乡杨家村,埂头村民委员会,冯家村,塘里村,茶科所,油墩街镇潼港村,饶埠镇蔡家村,三庙前乡濠湖村,梅港乡董家村,湾里乡李桥村,东灵村,新岗山社区居民委员会与体泉村民委员会争议地,阆山村委会,齐埠乡齐埠村,石镇镇坑堧村,金盘岭镇汪桥村,古县渡镇滩上村,鸟桥村,八都社区居民委员会,枧田街乡大源村,三县岭综合垦殖场程桥村,港口镇小店村,篁碧乡畲族村,马岭底村村民委员会,山底村,詹村居民委员会,游城乡花桥村,梅港乡樟山村,葛源镇山田村,涨畈村民委员会,楼村村,湖头社区居民委员会,下社村民委员会,灵湖村民委员会,黄村村与车田村争议,汪家乡新华村,莲湖乡裕丰村,瑞洪镇前山村,葛仙山镇石涵村,双元村民委员会,下溪街道办事处,和尚渡村民委员会,大南磷矿,胜利亭社区居民委员会,裴梅镇汪家村,珠田乡榜林村,古县渡镇建桥村,柘港乡南水村,团林乡清湖村,永平镇卢家村,永平垦殖场,毛埂村,上饶县田墩镇长塘村,占坑村委会,双港镇乐兴村,饶州街道办事处金家山村,枫港乡后塘村,古埠镇干港村,葛源镇篁村,河口镇龙角湖村,紫溪村与排山村争议,茭塘村民委员会,蒋坞村民委员会,黄砂村委会,谢家滩镇广畈村,金盘岭镇良田村,游城乡踏溪村,江埠乡毛坊村,洪家嘴乡石岭村,南山社区居民委员会,枧底社区居民委员会,青岩村民委员会与油麻坞村民委员会争议,湖坊镇西山村,仓坞村民委员会,下珠村民委员会,外山村民委员会,高坂村,大屋村,王村村委会,汪村村委会,谢家滩镇三潼镇村,凰岗镇麻埠岭村,饶丰镇马家村,莲湖乡美林村,朝阳乡光明村,梅港乡老虎口村,大塘乡同心村,平埂村民委员会,济腰村,溪头村民委员会,石溪村民委员会,紫阳镇坑口村与德兴市争议,金盘岭镇新义村,三庙前乡山闾村,黄金埠镇高桥村,圭峰镇果园场,永平镇河背村,武夷山镇车盘分场,郑家墩村民委员会,后陈村民委员会,傅家棚村民委员会,黄村村委会,城关村委会,陈营镇南岗村,饶州监狱4队,梅港乡维城村,瑞洪镇小山村,羊石村,石岩村民委员会,瑞洪镇东一村,曹溪镇东港村,农科所,石塘镇尤田村,湖坊镇横塘村,吕家源村民委员会,定坑村民委员会,东石村委会,裴梅镇裴家村,响水滩乡草埠村,大溪乡槐梓村,禾斛岭垦殖场黄沙岗社区,社赓乡社赓村,葛仙山镇局里村,篁碧乡茶场,竹川村民委员会,三联村,水北社区居民委员会,新屋村委会,油墩街镇港湖村,团林乡青山村与清湖村争议,三塘乡赤岸村,漆工镇仙湖村,中畈乡人民政府,葛仙山镇余源村,黄坳村民委员会,四股桥村民委员会,三里村民委员会,戴村村与程村村争议,凰岗镇神山村,三塘乡神埠村,圭峰镇中屋村,兴安街道办事处城郊村,葛仙山镇南耕村,吕畈村民委员会,建设村民委员会,黄塘村,张村村民委员会,油墩街镇潼莲村,乐丰镇东风村,乐丰镇泗联村,侯家岗乡狮子门村,银宝湖乡青林村与民主村争议,葛源镇黄山村,前汪村,柳坞社区居民委员会,占才村民委员会,庆源村与段莘村争议,河山坦村委会,小港村委会,鄱阳镇桂湾村,枧田街乡枫林村,古埠镇袁墩村,六都村民委员会,桥棚村民委员会,拱大村,皂头居委会,新村村民委员会,舒家村民委员会,南溪村民委员会,乡茶场,田畈街镇马头村,饶丰镇过水埂村,响水滩乡洋埠村,陈坊乡长寿村,板桥居民委员会,白石村民委员会,南岩村,茶园村,澄村村民委员会,古埠镇古山村,社赓乡土桥村,古埠镇镇尾村,清湖乡栗塘村,青板乡排楼村,葛仙山镇管源村,新屋村民委员会与墩上村民委员会争议,珠田乡珠田村,响水滩乡新兴村,三县岭综合垦殖场店上村,天柱山乡葛仙山林场,港口村民委员会,前程村,王家山村,岑丰村,苏塘社区居民委员会,江西省大茅山造纸厂,侯家岗乡陈岭村,游城乡屯田村,游城乡龙头村,白沙洲乡汪家村,莲湖乡高桥村,三塘乡赤岗村,三塘乡下谭村,横峰县莲荷乡杨家村,均郑村民委员会,吟阳村民委员会,溪头乡城口村与江湾镇江湾村争议,梓埠镇兰塘村,高家岭镇芦埠村,凰岗镇东溪村,响水滩乡鸡峰村,游城乡土塘村,中关村村民委员会,应坊村,上汪村,丁家仓村,大门底村民委员会,浙江省衢州市江山市凤林镇,江埠乡蛇塘村,玉亭镇洲上村,河口镇河口茶场场部,英将乡坪阳林场,周佃村民委员会,上西坑村村民委员会,车田村委会,太白林场,双港镇龙头山村,饶州监狱5队,洪家嘴乡永兴村,杨埠镇枫林村,西山底村民委员会,天柱山乡佛寨村,锦溪村民委员会,东社村民委员会,郑宅村,窑山村,严村社区居民委员会,锦坑村民委员会,万村村民委员会,黄柏乡胡家村民委员会与万村乡新屋村民委员会争议地,盘坑村委会,双港镇利池村,白马桥乡詹湾村,黄金埠镇长岭村,瑞洪镇湾头村,东塘乡富裕村,司铺乡刘家村,高枧村委会,冷亭村委会,大源镇严家村,油墩街镇西湖村,英将乡英将村,洋塘村民委员会,大坪社区居民委员会,畴口居民委员会,吊钟村民委员会,岩前村与甲路村争议,江湾村与栗木坑村争议,大源镇荷溪村,上坊乡高墩村,高家岭镇大宗村,樟宅桥村,军潭村民委员会,西坂村民委员会,松山村民委员会,凰岗镇龙阳村,双港镇新民村,柘港乡云湾村,南岩镇贞畈村,进士村民委员会,湖墩村,苏桥乡林店村,油墩街镇莲北村,柘港乡垅里村与莲港村争议,白马桥乡潼湖村,港口镇人民政府,南岩镇水南村,马路社区居民委员会,新田村,洲村村,湖林村委会,谢家滩镇晚禾村,古县渡镇中源村,饶埠镇湾埠场,江埠乡前坊村,梅港乡金埠村,三塘乡三房村,圭峰镇招宾村,葛源镇陈村湾村,兴安街道办事处回垅村,陈坊乡陈坊村,姜山村,古县渡镇昔塘村,峡山林场霞山村,梅港乡杜家岭村,三塘乡三溪村,曹溪镇人民政府,四甲村民委员会,县园艺场,上孚村民委员会,四吉居民委员会,坑口村委会,桐木汰村委会,曹村村委会,齐埠乡蛇湾村,珠湖乡陈湾村,龙门畈乡柯家村,边山村民委员会,铅岭村民委员会,龙门畈乡鲁村,东湖村与杨箭村争议,乌鹰村民委员会,尊桥村,东汪村,玉山县六都乡郑家墩村,大畈村民委员会,瑶畈村民委员会,汤村村委会,砚山村委会,石镇镇朱砂村,田畈街镇吴家村,武夷山镇下渠分场,杉溪社区居民委员会,古县渡镇鸳鸯村,柘港乡潼东村,珠湖乡曹家村,洪家嘴乡新村村,康山垦殖场插旗洲分场,葛源镇溪畈村,县农科所,江湾村与钟吕村争议,湖云乡湖云村,珠田乡越溪村,游城乡新畈村,葛仙山镇南湖村,竹园村民委员会,后叶村民委员会,尖山村民委员会,市茶叶示范场,龙山村与中云村争议,响水滩乡三村圩村,白沙洲乡大塘村,上饶县上泸镇小源村,金桥居民委员会,珠湖村民委员会,红石村,丁家村,沙溪镇沙溪村,潘村村委会,古县渡镇南坂村,鄱阳湖,紫溪乡果木场,槐芳村民委员会,修文街社区居民委员会,赋春镇盘坑村与浮梁县争议,鄣公山,高家岭镇程塘村,凰岗镇柏树下村,双港镇双丰村,白沙洲乡创业村,姜村社区居委,瑞洪镇南墩村,莲荷乡义门村,英将乡大横村,玉马村民委员会,斧市村民委员会,后坪村,新南居民委员会,裔村村委会,新田村委会,下溪村委会,梓埠镇五一茶场,田畈街镇新曹村,龙潭居民委员会,五石村民委员会,饶埠镇桥南村,团林乡青山村,黄金埠镇河桥村,洪家嘴乡朱湾村,姚家乡姚家村,太源乡畲族村,兰村村民委员会,乐丰镇丰源村,大溪乡石门村,黄金埠镇胡家洲村,东塘乡东风村,旭光综合垦殖场,五里村民委员会,圭峰镇箭竹村,永平镇排上村,新滩乡蒋家村,新滩乡螺石村,太平村,梧桐坞村民委员会,江西省德兴铜矿,引浆畲族村民委员会,四十里街镇青龙村,乐丰镇钱家村,饶埠镇高丰水库,柘港乡明德村,刘家分场,昌洲乡马湖村,玉亭镇眠山村,社赓乡李梅村,青板乡青板村,永平镇港洲村,东津桥村民委员会,黄柏洋村民委员会,陈营镇石鼓村,凰岗镇东康村,响水滩乡长山垄村,游城乡桂湾村,珠湖乡铺田村,杨埠镇花园村,曹溪镇内洪村,官仓边村民委员会,里洋村,墩上村民委员会,庐坑村委会,油墩街镇漳田村,鄱阳镇角山村,湾里乡西李村,龙门畈乡坊源村,鹅湖镇彭塘水库,官宅村民委员会,小溪畲族村,虹关村委会,古县渡镇古县渡镇农科所,银宝湖乡大山村,葛仙山镇长岭村,上湖田村民委员会,长塘村,枫岭头村,桂湖村民委员会,善坑村委会,湖山村委会,塘尾分场,柘港乡瑞洪村,游城乡官田村,游城乡白杨村,南岩镇光辉村,茗洋关水库,大南村民委员会,石人村民委员会,程村村委会,四十里街镇共和村,凰岗镇富林村,侯家岗乡永丰村,三庙前乡栎树村,莲湖乡龙口村,张岭村民委员会,三都村,瑞洪镇镇郊村,石口镇鱼池村,漆工镇窖头村,司铺乡司铺村,鹅湖镇银村畈村,英将乡汉阳村,金坑村委会,高家岭镇双坽村,凰岗镇湾头村,古县渡镇松树村,饶州监狱7队,三塘乡塘西村,龙门畈乡满团村,渎口村民委员会,大路边村民委员会,双塘村民委员会,福建省南平市浦城县古楼乡,江西省德兴市大茅山林场,油墩街镇北源村,金盘岭镇东山坂村,乐丰镇东方村,三庙前乡雷村村,大溪乡楼埠村,高厅村民委员会,小丰村民委员会,瑞洪镇高峰村,康山垦殖场里溪分场,红桥垦殖场莲荷分场,永平镇永平铜矿,汪二镇艾家村,天柱山乡叠石村,杨家湾居民委员会,德兴市森林苗圃,大茅山集团官帽山林场与信用联社争议地,林塘村委会,谢家滩镇郭贺村,九龙镇山岩村,共大余干分校,石笋村民委员会,李家村民委员会,梓槎村委会,青云镇荷塘村,裴梅镇雅岗村,金盘岭镇茶园村,杨埠镇张坊村,叠山镇马岭村,港边乡善塘村,龙门畈乡洋叶村,茅村村,西岩村,大田村民委员会,虎溪村委会,田畈街镇后屋村,金盘岭镇金楼村,侯家岗乡船湾村,响水滩乡周畈村,塘狮村民委员会,二渡关村民委员会,刘家坞居民委员会,枧田街乡黄岭村,樟树墩镇大坝村,西山林场,三县岭综合垦殖场徐门村,石塘镇里洋村,横塘村民委员会,楼前山社区居民委员会,汪槎村委会,荷田村委会,裴梅镇荷桥村,枧田街乡丰田村,鸦鹊湖乡鸦鹊湖分场,双井村民委员会,新岭林场,九龙镇瓜畲村,瑞洪镇柏叶房村,葛仙山镇下际村,稼轩乡雄田村,打铁坞村民委员会,水阁村民委员会,笪家庄村民委员会,凤山村与庐坑村争议,白石村与王村村争议,石门街镇北门村,饶埠镇畲塘村,游城乡高胜林场,李村村,梓里村民委员会,养塘村民委员会,高阳村民委员会,珠湖乡路口村,白马桥乡熊家村,三县岭综合垦殖场姚畈村,华山村民委员会,前洲村民委员会,板桥村,弋阳县,黄源村委会,大源镇界福村,芦田乡龙陂村,枫港乡号嘴村,康山垦殖场莲池村,王家畈村民委员会,东塘乡东塘村,清水塘村民委员会,下徐村民委员会,洪家居民委员会,竹岭村民委员会,关口村民委员会,洪家村委会,李坑村委会,石镇镇罗湖村,高家岭镇官庄村,凰岗镇石家村,乐丰镇铁丰村,江埠乡尧嘴村,樟树墩镇直源村,洲上村与汪二村争议,紫溪乡坑口村,十一都村民委员会,滩头居民委员会,油墩街镇西港村,鹭鸶港乡鹭鸶港村,麻墩村,五都社区居民委员会,叶家村民委员会,洪源上村委会,昌洲乡其林村,莲湖乡波湖村,饶州监狱8队,九龙镇山塘村,古埠镇邱家村,朝阳乡团结村,漆工镇朝阳村,河口镇柴家村,乡柑桔场,高坂分场,葛路村,湖口村民委员会,城南社区居民委员会,梅溪村民委员会,凰岗镇中新村,枧田街乡城墩村,莲湖乡莲湖村,叠山镇管家村,长塘源村,钱墩村,港口镇上坑村,紫溪乡创业队,小徐村民委员会,王宅水库管理局,中村村村民委员会,联胜村,程家湾村委会,谢家滩镇前杨村,莲湖乡莲池村,社赓乡中坊村,社赓乡滨塘村,社赓乡同良坂村,官塘社区居委会,石口镇前何村,葛源镇崇山村,莲荷乡上畈村,湖坊镇桐子岭水库,新滩乡杨家村,天柱山乡马岭林场,龙潭村委会,双河村委会,双港镇东桥村,古县渡镇星塘村,饶埠镇树下村,莲湖乡瓦屑坝村,金墀社区居民委员会,江埠乡西源村,黄金埠镇东梅村,葛溪乡人民政府,朱坑镇长源村,项源村与葛仙山林场争议,上饶县上泸镇王家山村,鄱阳镇朱家桥村,双港镇小华村,古县渡镇马埠村,饶埠镇户里村,玉亭镇关口村,九龙镇坂上村,前山村民委员会,十六都村民委员会,七都社区居民委员会,江埠乡墩上村,大溪乡青林村,鹅湖镇长港村,鹅湖镇月塘村,上饶县,白沙村,沙畈村民委员会,石镇镇中洲村,油墩街镇彭丰村,高家岭镇包丰村,昌洲乡北湖村,江埠乡江埠村,大塘乡和平村,瑞洪镇驾湖村,丁宅村,横山村,桐木汰林场,四十里街镇四十里街村,凰岗镇东门渡村,游城乡范田村,葛源镇人民政府,葛仙山镇港东村,洪家村,新峰林场,南屏社区居民委员会,齐埠乡左畲村,银宝湖乡西分村,社赓乡邓墩村,社赓乡畈上村,武夷山镇乌石分场,王洋社区居民委员会,西园村民委员会,大鄣山乡洪源上村与沱川乡河西村争议,田畈街镇何彭村,瑞洪镇永红村,下仓村民委员会,三清乡岭头山林场,吴洲村,洋塘村,南峰村,壶山村民委员会,女儿田社区居民委员会,大茅山集团官帽山林场,大鄣山乡西山村与浮梁县争议,江湾镇江湾村与溪头乡砚山村争议,田畈街镇玉田村,田畈街镇牌楼村,洋口镇烟花厂,茅家岭220Kv变电站,田畈街镇牌楼分场与玉田村争议,凰岗镇金方村,余干县人民政府,鹭鸶港乡沿河村,坞口村民委员会,苎圳村,港首村民委员会,河东村委会,凰岗镇河东村,侯家岗乡太平坦村,柘港乡胡家村,团林乡团林村与藕塘村争议,枫港乡大都村,江埠乡黎背村,枫港乡白家圩村,朱坑镇蔡家村,葛仙山镇长生村,石桥村民委员会,大茅山集团梧风洞实业公司,石门街镇徐墩村,古县渡镇龙潭村,乐丰镇方宋村,游城乡研下村,珠湖乡雨田村,珠湖乡李山村,葛溪乡港渡村,鹅湖镇公果村,汪二镇港沿村,体泉村民委员会与西坑村民委员会争议地,考水村委会,四十里街镇暖水村,凰岗镇下炉村,古县渡镇龙燕村,枧田街乡麻痛医院,湾里乡周店村,垦殖场与八水源村争议,坂心村,廿三都村民委员会,清淤村民委员会,芦田乡板桥村,洪家嘴乡南塘村,洪家嘴乡山下村,古埠镇象山村,鹭鸶港乡方家洲村,清湖乡庙脚村,花林村民委员会,新建村民委员会与体泉村民委员会争议地,马家村委会,高家岭镇站前村,饶埠镇天堂村,侯家岗乡塘西村,上呈村民委员会,东井村民委员会,青桥村民委员会,管家村民委员会,枫港乡大淮村,湖坊镇枧山村,洋岩村民委员会,上田分场,东山村,周石村,立新煤厂,饶埠镇坞年冲村,响水滩乡河港村,石口镇院前村,河口镇拘役所,莲塘社区居民委员会,樟木村民委员会,泉洋村,樟村村,上饶县田墩镇廖家村,下源村民委员会,鹅湖镇后洲村,天柱山乡紫源村,湖村桥村民委员会,大东坑林场,吴园社区居民委员会,岭下村委会,占门分场,油墩街镇港头村,曹溪镇曹溪村,龙门畈乡钱家村,鹅湖镇罗溪村,湖坊镇河西村,三里街社区居民委员会,叶桥村民委员会,苏溪村民委员会,秦峰村民委员会,石镇镇珏田村,凰岗镇新塘村,昌洲乡永林村,峡山林场坂坞村,文成村民委员会,许家社区居民委员会,观上村,胡家村委会,许村村委会,陈营镇社里村,苏桥乡岗上村,金盘岭镇广洲村,双港镇下常村,联合村,黄丰村民委员会,铜山村民委员会,古县渡镇罗山村,鸦鹊湖乡独山分场,黄金埠镇株桥村,三塘乡明湖村,漆工镇湖塘村,汪二镇东湖村,浅港村民委员会,港西村民委员会,谢家滩镇东堡村,金盘岭镇合录村,三塘乡刘家村,曹溪镇新屋村,虹桥乡莲塘村,湖坊镇桥北村,双溪村民委员会,方村社区居民委员会,信州区秦峰乡新塘村,叶村村民委员会,东坞村民委员会,珠田乡珠湾村,油墩街镇柘下村,油墩街镇湖滨村,双港镇乐湖村,陶源村民委员会,玉山县文成镇乌鹰村,后阳村民委员会,游城乡云峰村,莲湖乡林场,大溪乡湖坊村,梅港乡学源村,康山乡团结村,圭峰镇圭峰村,一都村委会,齐埠乡黄坪村,金盘岭镇梅岭村,洪家嘴乡园艺场,龙门畈乡龙门村,虹桥乡桥亭村,陈坊乡万年村,枫岭村,大山林场,中心城区,古坦林场,周溪村委会,油墩街镇同兴村,古县渡镇古枫村,石口镇石口村,湖坊镇安兰村,岩洲村民委员会,中路村,婺源县人民政府,谢家滩镇田铺村,石门街镇金亭村,柘港乡荷塘村,白马桥乡白马村,江埠乡米湾村,黄金埠镇塘背村,梅港乡炭埠村,瑞洪镇桥里村,鹅湖镇上古埠村,关山桥村民委员会,渔潭村与李坑村争议,梓埠镇燃湖村,响水滩乡阳畈村,响水滩乡李嘴村,柘港乡九虞村,大塘乡幸福村,南岩镇宝峰村,司铺乡宋村,武夷山自然保护区,福建省,上潭水库,上饶县花厅镇金鸡村,板桥村民委员会,鄱阳镇桂中村,凰岗镇太阳埠村,双港镇新田村,饶埠镇塔湖场,玉亭镇毛溪村,杨埠镇江坪村,洪家嘴乡左桥村,砻坊街社区居民委员会,南门社区居民委员会,田畈街镇大王山分场,乐丰镇茨山村,三县岭综合垦殖场,清湖乡龙山村,龙门畈乡霞坊村,德兴市,西龙岗村,市水稻良种场,曹家山良种场,大源镇大源村,饶埠镇韩湾村,柘港乡金潭村,枫港乡石溪村,梅港乡油源村,新滩乡麻车村,石塘村民委员会,山塘村民委员会,许村镇茶场,长尧村委会,高家岭镇车廊村,枧田街乡黎岭村,柘港乡柘港村,枫港乡增产村,洪家嘴乡中湖村,大溪乡邹坊村,三塘乡松山村,葛仙山镇中洲村,毛宅村,东关社区居民委员会,园艺居民委员会,江湾村委会,湖云乡黄家村,鄱阳镇磨刀石村,饶丰镇铁路村,江埠乡郭泗村,石门村,陈墩村,壶峤社区居民委员会,黄金埠镇松霞源村,杨埠镇长吉村,漆工镇程家村,葛溪乡过港村,横林村与横峰村争议,紫溪乡汪源村,银鹿社区居民委员会,黄柏乡良种场,石镇镇周家村,上坊乡奎田村,鄱阳镇道汊村,乐丰镇红英村,紫溪乡排山村,东坳村村民委员会,三庙前乡三庙前村,汪二镇走马村,永平镇林家村,紫溪乡铺前村,武夷山镇薛家分场,陈坊乡福田村,铜埠社区居民委员会,石门街镇段庄村,黄金埠镇湖田村,古埠镇童埠村,曹溪镇邵坂村,兴安街道办事处,天柱山乡高际岭茶场,祝村村民委员会,岛山村,十字垄村民委员会,王家村民委员会,官坑村委会,石门街镇东山村与新村村争议,古县渡镇钟岸村,古县渡镇中心村,饶丰镇饶丰镇良种场,三庙前乡柘坽村,苏桥村,上饶地区油库,芦田乡矿山村,黄金埠镇枫树村,梅港乡梅港村,大塘乡陈家塘村,圭峰镇上张村,龙门畈乡童家村,暖水村民委员会,溪头村委会,晓林村委会,田畈街镇王畈村,河口镇七里村,河口镇畜牧场,叶家分场,台湖村,花桥村民委员会,泸口村民委员会,大鄣山乡鄣山村与安徽省争议,梅田村委会,社赓乡蔡畲村,大塘乡江家山村,樟树墩镇岩山村,永平镇文家桥村,大垄村民委员会,殿口村民委员会,回树底村民委员会,里源村委会,白马桥乡藕塘村,黄金埠镇南谷村,三塘乡冷井村,瑞洪镇大源垄村,康山乡王家村,陈坊乡破港村,沿坂村,左溪村,麦园社区居民委员会,德兴市人民政府,项家埠村委会,团林乡三十里康村,饶州监狱10队,大溪乡牛皮山村,篁碧乡中村村,坊头村民委员会,岭溪村委会,汪家乡山下村,洪家嘴乡甘家村,红桥垦殖场白沙岭分场,新滩乡莲花村,怀玉乡童坊林场,墩底村,段莘村委会,田畈街镇九湾村,玉亭镇太阳村,乌泥镇赵家村,鹅湖镇凤来村,走马村与高岭村争议,松坪村,赣东北地质队,和村村委会,虹冲村委会,珠田乡库田村,游城乡高坊村,大溪乡岭底村,黄金埠镇华山村,鹅湖镇双合村,紫溪乡文山村,占坂村民委员会,底坞村民委员会,石谢社区居民委员会,河源村民委员会,玉坦村委会,黄金埠镇塘湾村,河口镇森林苗圃,嘉湖村民委员会,王家坝村民委员会,程村村民委员会,煌固村,下坊社区居民委员会,王村村民委员会,杨溪村委会,田畈街镇方家村,高家岭镇龙岭村,三塘乡源头村,柴门村村民委员会,双溪分场,傅家村,苏家村民委员会,玉山县,油墩街镇晏桥村,三庙前乡和丰村,李梅林场桃源村,圭峰镇桥坂村,湖潭村,岑阳镇铺前村,汪二镇横林村,沽溪村与福田村争议,稠川村,中洲村,黄坑村,高家岭镇五十里岗村,双港镇竹林村,莲湖乡莲华村,莲湖乡毛家村,莲湖乡山背村,芦田乡栎林村,河口镇洋田村,稼轩乡马鞍山村,松岭村民委员会,吉阳村,龙尾村委会,大源镇江田村,饶埠镇过江村,水口村民委员会,谢家滩镇余畈村,三庙前乡万安村,枫港乡程坊村,梅港乡青山村,三塘乡濠湖村,老坞村民委员会,朝阳村民委员会,葛源镇清湖村,岑阳镇岑港村,姚家乡人民政府,信州区,灵峰村,杨坞村民委员会,苏桥乡下门村,青云镇西北村,凰岗镇华山村,昌洲乡永平村,洪家嘴乡中山村,黄金埠镇吴艾村,玉山县文成镇,塘上村民委员会,梅港乡坂头一村,石口镇吴家村,莲荷乡蔡家村,石塘镇丁马山村,稼轩乡岩前村,五角塘社区居民委员会,建节水社区居民委员会,梓埠镇联合村,珠湖乡丰产村,杨埠镇河埠村,古埠镇保安村,弋江镇大树村,万柳洲社区居民委员会,桐西村,洋江社区居民委员会,桐畈社区居民委员会,占村村民委员会,洋田村民委员会,李宅村民委员会,汪家乡岩山村,芦田乡洄源村,朱坑镇荷塘村,汪二镇丰产队,葛仙山镇茅排村,山边居民委员会,仓畈村民委员会,徐村社区居民委员会,金城社区居民委员会,南岸村民委员会,中村村委会,赋春镇游汀村与许村镇仁洪村争议,低源村委会,油墩街镇麻下村,争议地,大石山村民委员会,徐家村民委员会,地区农科所,双港镇鸦桥村,枫港乡牌头村,古埠镇高门村,乌泥镇乌泥村,港口镇港口村,东坑村民委员会";

    private static void mapingVillage() {
        List<String> sources = Arrays.asList(source.replaceAll("\\s*", "").split(","));
        List<String> villages = Arrays.asList(village.replaceAll("\\s*", "").split(","));
        Map<String, String> map = new HashMap<>();

        for (String target : sources) {
            String key = target;
            map.put(key, null);
            try {
                for (String county : county_key) {
                    if (target.contains(county)) {
                        //排除社区关键字干扰
                        if (target.contains("社区")) {
                            if (target.split(county).length > 2) {
                                target = target.split(county)[1];
                            }
                            continue;
                        }
                        target = target.split(county)[1];
                    }
                }
                //去除镇一级干扰
                for (String town : town_key) {
                    //排除社区关键字干扰
                    if (target.contains("镇镇")) {
                        if (target.split("镇镇").length > 2) {
                            target = target.split("镇镇")[1];
                        }
                        break;
                    }
                    if (target.contains(town)) {
                        target = target.split(town)[1];
                    }
                }
                //进行映射村一级
                if (target.endsWith("村")) {
                    if (villages.contains(target)) {
                        map.put(key, target);
                    } else if (villages.contains(target.replace("村", "社区"))) {
                        map.put(key, target.replace("村", "社区"));
                    }
                } else if (target.endsWith("社区")) {
                    if (villages.contains(target)) {
                        map.put(key, target);
                    }
                } else if (target.endsWith("居民委员会")) {
                    target = target.split("居民委员会")[0];
                    if (target.endsWith("社区")) {
                        if (villages.contains(target)) {
                            map.put(key, target);
                        }
                    } else {
                        if (villages.contains(target + "社区")) {
                            map.put(key, target + "社区");
                        }
                    }
                } else if (target.endsWith("居委会")) {
                    target = target.split("居委会")[0];
                    if (target.endsWith("社区")) {
                        if (villages.contains(target)) {
                            map.put(key, target);
                        }
                    } else {
                        if (villages.contains(target + "社区")) {
                            map.put(key, target + "社区");
                        }
                    }
                } else if (target.endsWith("村民委员会")) {
                    if (villages.contains(target.split("村民委员会")[0] + "村")) {
                        map.put(key, target.split("村民委员会")[0] + "村");
                    }

                } else if (target.endsWith("村委会")) {
                    if (villages.contains(target.split("村委会")[0] + "村")) {
                        map.put(key, target.split("村委会")[0] + "村");
                    }
                } else {
                    map.put(key, null);
                }

            } catch (Exception e) {
                System.err.println(key + "匹配出错");
            }
        }
        //写入文件
        try {

            BufferedWriter fw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(
                    "C:\\Users\\leige\\Desktop\\村级映射_" + UUID.randomUUID().toString().substring(0, 8) + ".csv"), "GBK"));
            StringBuilder builder = new StringBuilder();
            builder.append("权属单位名称,村名称\n");
            for (Entry<String, String> entry : map.entrySet()) {
                builder.append(entry.getKey() + "," + entry.getValue() + "\n");
            }
            fw.write(builder.toString());
            fw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        mapingVillage();
    }

}