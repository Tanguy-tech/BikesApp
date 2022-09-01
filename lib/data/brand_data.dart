import 'package:flutter/material.dart';
import 'package:meals_app/models/models.dart';

import '../models/category.dart';

List<Category> brandCategories = [
  Category(
    id: 'c1',
    title: 'Suzuki',
    color: Colors.blue.shade900,
    logo: Image.asset('assets/brand_logos/Suzuki.png'),
    models: [
      Model(
          id: 'm1',
          brand: 'Suzuki',
          brandLogo: Image.asset('assets/brand_logos/Suzuki.png'),
          name: 'DR650 RSE',
          hp: '46',
          manufacturedDate: '1990',
          photo: Image.asset('assets/bike_models/dr650rs.png'),
          infos:
              "Le concept trail évolue, se transforme, s'enrichit, au risque de perdre son esprit originel. Qu'il soit routier, GT ou enduro, il n'en demeure pas moins qu'ils sont de moins en moins nombreux à défendre le principe du gros trail simple et polyvalent. A l'image du 600 XT, le DR 650 de Suzuki continue à entretenir la flamme, et de fort belle façon. Flatteur par sa légèreté et son agilité, ce trail mono séduit tout autant qu'il réjouit. Avec ses suspensions de grand débattement (qui peuvent être abaissées afin de diminuer la hauteur de selle), la machine peut très bien s'aventurer sur les chemins esquintés. On y apprécie le freinage puissant mais point trop agressif. Le moteur est efficace et ne vibre pas trop. Rien n'empêche de s'aventurer sur la route à condition d'être raisonnable. Protection très limitée, petite selle pas bien tendre, autonomie réduite - Mieux vaut habiter pas très loin de la mer si vous voulez y aller."),
      Model(
        id: 'm2',
        brand: 'Suzuki',
        brandLogo: Image.asset('assets/brand_logos/Suzuki.png'),
        name: 'GSXR1000',
        hp: '202',
        manufacturedDate: '2021',
        photo: Image.asset('assets/bike_models/gsrx1000.png'),
        infos:
            "15 ans après la première série spéciale, Suzuki Angleterre sort une nouvelle édition limitée de GSX-R 1000 Phantom. Hypersport ténébreuse à la poursuite de sa gloire, elle entreprend de séduire les âmes de la nuit et des chronos bouillants. La grosse Gex passerait presque pour une compagne de 007 avec son nom «phantom-atique», amplifié par cette déco toute noire et cette profondeur égratignée de quelques scintillements. Les jantes à la dorure sombre et la fourche inversée Showa apportent une touche classieuse à la Suzuk’. Le cocktail noir et or est éternel. Si les fantômes ont la réputation de faire des sons étranges provoquant l’effroi, la GSX-R 1000 R Phantom compte plutôt sur son silencieux Yoshimura R11 pour faire hurler de puissance son 4 cylindres de 202 chevaux. D’autres accessoires font partie de la dotation, comme le capot de selle assorti, des protections pour le réservoir, les leviers de commande et la trappe à carburant, ainsi que la bulle haute fumée.",
      ),
    ],
  ),
  Category(
    id: 'c2',
    title: 'Yamaha',
    color: Colors.blue.shade600,
    logo: Image.asset('assets/brand_logos/Yamaha.png'),
    models: [
      Model(
        id: 'm3',
        brand: 'Yamaha',
        brandLogo: Image.asset('assets/brand_logos/Yamaha.png'),
        name: 'Ténéré 700',
        hp: '74',
        manufacturedDate: '2022',
        photo: Image.asset('assets/bike_models/t7.png'),
        infos:
            "Le soleil dessine une ombre sous le pied, épousant les contours irréguliers d'une surface joueuse tant que piégeuse. La botte se pose, s'enfonce légèrement de biais dans l'épaisse semoule dorée. Un peu plus loin, elle ripe d'une chiquenaude sur les quelques caillasses qui se sont perdus par millions. L'empreinte sera balayée en quelques heures par le vent, la poussière, les Hespérides, tandis que s'enclenche un rapport pour faire décoller la 700 Ténéré vers les aventures qu'elle désire. Le temps est venu pour le retour d'une machine de raid de moyenne cylindrée chez Yamaha. Depuis que le marché a été inondé de trails énormes, plus ou moins apte à sortir des routes pour des chemins et des rocs, on ne trouvait plus guère d'engins au gabarit mesuré et vraiment prêts pour des raids de tous poils. Mais les constructeurs ont senti ce courant et de nouvelles candidates annoncent leurs promesses. F 850 GS ou Africa Twin dans leur propre mesure, 890 Adventure sur le même objectif, et la machine d'Iwata– une Ténéré mid-size avec de grandes jambes et autant d'ambition.",
      ),
      Model(
        id: 'm4',
        brand: 'Yamaha',
        brandLogo: Image.asset('assets/brand_logos/Yamaha.png'),
        name: 'R1',
        hp: '200',
        manufacturedDate: '2022',
        photo: Image.asset('assets/bike_models/r1.png'),
        infos:
            "Toujours très plébiscitée et performante, la R1 attaque une nouvelle saison. La concurrence reprend du poil de la bête (ZX10-R, CBR 1000 RR-R, M 1000 RR) ou lâche la compét' au profit d'une autre strate de performance (RSV4 1100). Le WSBK et les championnats de fort calibre sont sa ligne de mire. La Yamaha y fait belle figure mais dans ce monde à haute vitesse, le temps a marqué une étape pour elle en 2020 - avec pas mal de petites évolutions. Surtout coté technique. La liste est longue et les nouveautés raviront les fans d’électronique. Coté design, la R1 bouge très peu. Toujours très inspirée par la M1 de MotoGP, elle se contente de retoucher quelque peu son faciès et ses flancs au niveau du réservoir. L’œil doit être aguerri pour percevoir les différences. Mais l’efficacité est là : L'efficacité aérodynamique est augmentée de plus de 5 %, ce qui se traduit par des performances plus importants à haute vitesse. Les nouveaux phares LED et les feux de position LED repensés soulignent davantage l'aspect et le caractère de ce modèle 2020. Ce carénage intègre un nouveau conduit d'air en aluminium situé à l'arrière pour une rigidité accrue. La partie inférieure du carénage qui couvre le système d'échappement est désormais fabriquée en titane. Sous la surface, par contre, le détail est bien plus prolixe. 200 chevaux. C’est la norme depuis quelque temps dans cette catégorie. Le moteur crossplane les développe toujours, sans augmentation depuis la génération précédente mais ce n’est pas pour autant que les ingénieurs sont restés les bras croisés.Ils ont amélioré les performances du 4 cylindres à haut régime grâce à l'adoption de nouveaux culbuteurs à linguets à linguets et de nouveaux profils de came qui offrent un levage de soupape optimisé, ainsi que des ouvertures et fermetures de soupape plus stables à régime élevé. Ceci garantit un fonctionnement plus souple et plus efficace du moteur.",
      ),
    ],
  ),
  Category(
    id: 'c3',
    title: 'Honda',
    color: Colors.red.shade900,
    logo: Image.asset('assets/brand_logos/Honda.png'),
    models: [
      Model(
        id: 'm5',
        brand: 'Honda',
        brandLogo: Image.asset('assets/brand_logos/Honda.png'),
        name: 'CBR1000RR-SP',
        hp: '217',
        manufacturedDate: '2021',
        photo: Image.asset('assets/bike_models/cbr1000rr-sp.png'),
        infos:
            "La poignée de gaz est dans le coin, tordue à l'approche de l'agonie. Le launch control bosse tant qu'il peut, se demandant s'il ne va se faire déborder par cette énorme puissance qui transite à quelques instants de lui. Premier rapport – on est déjà dans l'illégalité ; deuxième rapport – on aperçoit le royaume de la vitesse ; troisième – il est déjà trop tard pour se poser des questions. De toute façon, le barregraphe continue son épilepsie ; quatrième – la CBR 1000 RR-R commence à montrer son véritable visage, défiant toutes les hypersports actuelles ; cinquième – les km/h n'ont plus aucune importance ; sixième – le regard fusionne avec le chrono pendant que la Honda dépasse son destin. La 1000 Fireblade est passée dans une autre dimension. Elle qui s'est toujours distinguée par son coté 'conciliant' bascule dans la radicalité. Il n'existe pour elle plus qu'un seul objectif : le Superbike. Pour gagner, pour oublier les années de disette en victoire. Totalement nouvelle, elle veut écraser ses rivales et se pointe à l'aspi de la Ducati V4R. Gardez du souffle, ouvrez les yeux et donnez ce terreau à votre imagination avant qu'elle ne le transforme sur piste : la nouvelle CBR 1000 RR-R crache un impressionnant 217 chevaux !!!! Ce n'est pas une louche ni un godet de puissance que la grosse CBR a gagné mais un saladier. Elle qui était la moins puissante de la bande (192 chevaux tout de même), voila qu'elle met une gifle à toute la concurrence. La progression est impressionnante : 25 ch de bonus. Ce qui la place de facto bien au-dessus de ses compatriotes. Les Kawasaki ZX-10 R, Yamaha R1 et Suzuki GSX-R sont séchées. L'Aprilia RSV4 écorchée. Surpuissante, la BMW S 1000 RR prend une gifle un peu moins salée. La CBR se permet même de dépasser les 214 ch de la 1100 Panigale, mieux pourvue en cylindrée (et en couple). Seule la V4-R garde la tête haute grâce à ses solutions techniques d'exceptions – pour le double du prix. Honda aurait-il enfin renoué avec le V4 et dégonflé un moteur de RC 213 V pour le placer dans son nouveau missile ? Hélas non... Enfin, pas tout à fait. Point ombrage il ne doit en être, car le 4 cylindres en ligne de cette CBR pédale comme c'est pas permis.",
      ),
      Model(
        id: 'm6',
        brand: 'Honda',
        brandLogo: Image.asset('assets/brand_logos/Honda.png'),
        name: 'CRF1100L',
        hp: '102',
        manufacturedDate: '2022',
        photo: Image.asset('assets/bike_models/crf1100L.png'),
        infos:
            "2022 est l'occasion pour la 1100 Africa Twin de gagner en équipement. La partie arrière reçoit un porte-paquet en aluminium ainsi que des points d'ancrage pour les valises. En regardant un peu dans le 'rétroviseur', on constate que ces équipements étaient installés en série sur la 1000 puis disparurent quand la 1100 pris le relais sur le marché. Un retour plus qu'un bonus... Pour la version DTC, la transmission gagne en satisfaction avec plus de souplesse sur les deux premiers rapports. Honda ne change rien d'autre, rassuré par le succès de son Africa Twin et de ses qualités. Ce trail, parmi les plus aventuriers du marché, peut rouler tranquillement avec le museau relevé à la recherche des effluves épicés. Les habitants du sud ont parfois la surprise de sentir le goût du sable quand respire le vent. Une salutation de l'Afrique, amenée par le Scirocco et son air chaud. Chez Honda, un autre vent souffle mais avec la saveur de la réussite. C'est la conquête de l'Africa Twin. Le trail au nom quasi mythique a superbement réinvesti le secteur et su donner une nouvelle impulsion à l'aventure. Loin du coté gros SUV que défendait le 1200 Crosstourer, le 1000 CRF-L donnait le change et l'envie du périple ; d'embourbes en bourgs sans se soucier des faubourgs.",
      ),
    ],
  ),
  Category(
    id: 'c4',
    title: 'Triumph',
    color: Colors.teal.shade600,
    logo: Image.asset('assets/brand_logos/Triumph.png'),
    models: [
      Model(
        id: 'm7',
        brand: 'Triumph',
        brandLogo: Image.asset('assets/brand_logos/Triumph.png'),
        name: 'Scrambler 900',
        hp: '59',
        manufacturedDate: '2015',
        photo: Image.asset('assets/bike_models/scrambler 900.png'),
        infos:
            "Il y eu une petite mise à jour pour le Scrambler en l'an de grâce 2014. Avec des effluves de noir sur les jantes, les moyeux, le guidon et le bouchon du réservoir du maitre-cylindre arrière, la moto apprécie la philosophie du 'Back to Black'. Avec une selle revue, l'assise se veut plus détendue et le style adoubé par un logo Triumph en relief. Le moteur gagne un sabot en acier brossé anodisé et ses aillettes recoivent un coup de meuleuse pour faire respirer visuellement le métal. Si je vous dis 'Triumph' et que vous me répondez : 'Ah oui, la jeune marque anglaise qui a fait la Speed Triple et la Daytona 675 .'' ; laissez tomber... En revanche, si ce nom vous transporte dans le passé, à la terrasse des cafés brittons du milieu du siècle, dans les grands moments du Tourist Trophy, aux souvenirs de motos qui pissaient l'huile, en rade tous les 50 km et dont on tombait éperdument amoureux... Vous êtes prêt à accueillir dans votre coeur la nouvelle 900 Scrambler.",
      ),
      Model(
        id: 'm8',
        brand: 'Triumph',
        brandLogo: Image.asset('assets/brand_logos/Triumph.png'),
        name: 'Speed Triple RS',
        hp: '180',
        manufacturedDate: '2021',
        photo: Image.asset('assets/bike_models/speed triple rs.png'),
        infos:
            "C’est un grondementvorace, entre l’effort et la jouissance mécanique. Quand le muscle s’estaffranchi de ses propres limites pour soulever le fort, écraser les repères etvandaliser les sensations. Les yeux palpitent, la tension est électrique aumoment de découvrir la carte de visite de la 1200 Speed Triple RS. C’estbeaucoup plus qu’une évolution. Cette fois, c’est une féroce surexpression deson identité. La Triumph joue cash, elle fracasse! Du suspense seraitinutile. Prenons les gifles tout de suite avec 30 chevaux de plus dans la maindroite. Oui, 30 chevaux! La nouvelle puissance atteinte par le plusemblématique des streetfighters anglais est redoutable. On est passé de 150 à180 chevaux en l’espace d’une nuit. La Speed s’était endormie en 2020 avec untrois cylindres de 1050 cm3, sereine d’une force et d’une efficacité parmi lesmeilleures de sa catégorie. Au réveil, elle avait perdu 10 kilos, son blocaffichait fièrement dès lors1160 cm3, plein de watts en plus et presque 1 mkgde récolté. Mais qu’est-ce qui s’est passé?!?",
      ),
    ],
  ),
  Category(
    id: 'c5',
    title: 'Ducati',
    color: Colors.red.shade400,
    logo: Image.asset('assets/brand_logos/Ducati.png'),
    models: [
      Model(
        id: 'm9',
        brand: 'Ducati',
        brandLogo: Image.asset('assets/brand_logos/Ducati.png'),
        name: 'Hypermotard RVE',
        hp: '114',
        manufacturedDate: '2020',
        photo: Image.asset('assets/bike_models/hypermotard.png'),
        infos:
            "L'Hypermotard de Ducati, c'est un peu la version route d'un kite-surf, d'un skateboard ou d'une partie de chasse avec des loups roses et des lapins noirs : une machine dédiée au fun et à la déconnade. On sort du bureau, on range le costard dans la poubelle et on se défoule à grands coup de travers tant que de virolos musclés. Ayant développé une certaine polyvalence dans son apostrophe 939, l'HM revient à présent à des amours plus exclusifs, plus corporels, plus « Etienne, tiens-le bien ! ». Mais c'est plutôt du hard rock qu'on chantera une fois saisi la 950 Hypermotard.",
      ),
      Model(
        id: 'm10',
        brand: 'Ducati',
        brandLogo: Image.asset('assets/brand_logos/Ducati.png'),
        name: 'Panigale v4R',
        hp: '221',
        manufacturedDate: '2020',
        photo: Image.asset('assets/bike_models/panigale v4r.png'),
        infos:
            "En découvrant la Panigale V4-R, une chose se soulève entre le cœur et la colonne vertébrale : la tempête. Ducati vient de faire basculer le concept de l'hypersport dans la folie mécanique. Une seule définition apparait à cet instant, celle de Mark Renton dans Trainspotting : 'Rappelez-vous le meilleur orgasme que vous ayez jamais eu, multipliez le par 1000, et vous êtes encore loin de la vérité'.",
      ),
    ],
  ),
  Category(
    id: 'c6',
    title: 'Kawzaki',
    color: Colors.green.shade700,
    logo: Image.asset('assets/brand_logos/Kawazaki.png'),
    models: [
      Model(
        id: 'm11',
        brand: 'Kawazaki',
        brandLogo: Image.asset('assets/brand_logos/Kawazaki.png'),
        name: 'Z1000',
        hp: '142',
        manufacturedDate: '2020',
        photo: Image.asset('assets/bike_models/z1000.png'),
        infos:
            "Les combats font rage dans la jungle des gros roadsters. Yamaha MT-10, KTM 1290 Superduke, Aprilia Tuono V4 et BMW S1000R... sont tant de créatures terrifiantes et déchaînées. Complétement dépassés par la violence des affrontements, les verts profitent de leur teinte pour rester tapis dans les feuillages. Soucieux de la survie de leur combattante, le clan d’Akashi a décidé d’affûter sa Z1000. Malheureusement une refonte complète n’est pas encore à l’ordre du jour. Alors, il lui aiguise les griffes et la pare d’un coloris spécifique, souligné par deux traits de maquillage sur la tête de fourche, comme pour parfaire sa tenue de camouflage. Mais alors, pourquoi «R»? «R» pour rancune, peut-être. Rancunière face à tous ces prédateurs qui l’ont supplanté dans SA catégorie, celle des méchants roadsters. Ne vous attendez pas non plus à ce qu’elle ronronne, comme le veut sa philosophie «Sugomi» (pour 'instinct sauvage') la Z conserve son côté bestial.",
      ),
      Model(
        id: 'm12',
        brand: 'Kawazaki',
        brandLogo: Image.asset('assets/brand_logos/Kawazaki.png'),
        name: 'Nija H2R',
        hp: '310',
        manufacturedDate: '2020',
        photo: Image.asset('assets/bike_models/h2r.png'),
        infos:
            "Tous les superlatifs ont été utilisés pour définir la H2R. Quelques évolutions mineures auront ainsi du mal à trouver de l'écho dans l'aura de cette moto d'exception. Elles sont pourtant là, discrètes mais efficaces. Sont invités à bord une centrale inertielle multiaxes, un amortisseur Öhlins TTX36 en remplacement du Kayaba et un shifter qui fonctionne aussi à la descente des rapports. Le souci aérodynamique a été poussé un peu plus loin en perçant les leviers de frein et d'embrayage. Cela évite que l'air à haute vitesse ne pousse ces tiges. Il est vrai que les km/h déraisonnables et les accélérations dantesques sont la passion de cette Kawasaki.",
      ),
    ],
  ),
  Category(
    id: 'c7',
    title: 'Royal Enfield',
    color: Colors.yellow.shade700,
    logo: Image.asset('assets/brand_logos/Royal Enfield.png'),
    models: [
      Model(
        id: 'm13',
        brand: 'Royal Enfield',
        brandLogo: Image.asset('assets/brand_logos/Royal Enfield.png'),
        name: 'Interceptor',
        hp: '47',
        manufacturedDate: '2020',
        photo: Image.asset('assets/bike_models/interceptor.png'),
        infos:
            "Un vent de liberté souffle sur la Californie en 1963. Et sur ce zéphyr américain surfe une machine de légende : la Royal Enfield Interceptor. Son bicylindre de 736 cm3 est son meilleur atout pour se forger un succès commercial. 2018, le constructeur indien décide de reconquérir l’Occident avec une machine éponyme, équipée d'un nouveau twin de 648 cm3. Authentique est le mot juste pour désigner cette nouvelle Interceptor. Tant par la légitimité historique de la marque que par la filiation esthétique et mécanique de la nouveauté.",
      ),
      Model(
        id: 'm14',
        brand: 'Royal Enfield',
        brandLogo: Image.asset('assets/brand_logos/Royal Enfield.png'),
        name: 'Hymalayan',
        hp: '24',
        manufacturedDate: '2021',
        photo: Image.asset('assets/bike_models/hymalayan.png'),
        infos:
            "Être simple ne veut pas dire être largué. L'Himalayan 400 est à des années-lumières techniques d'une 1250 GS ou d'une Multistrada V4 mais elle sait se peaufiner. Dans les ornières, elle ne craint pas de leur tenir tête pour 4 fois moins cher. Il est temps de s'adapter à Euro5. Cela signifie une couche d'aménagements pour rendre le souffle plus propre, quelques réglages moteur, et une pincée de performance en moins. Coté agrément par contre, la panoplie est à la hausse.",
      ),
    ],
  ),
  Category(
    id: 'c8',
    title: 'Harley Davidson',
    color: Colors.orange.shade600,
    logo: Image.asset('assets/brand_logos/Harley.png'),
    models: [
      Model(
        id: 'm15',
        brand: 'Harley Davidson',
        brandLogo: Image.asset('assets/brand_logos/Harley.png'),
        name: 'Sportster 883 IRON XL',
        hp: '52',
        manufacturedDate: '2020',
        photo: Image.asset('assets/bike_models/sportster883.png'),
        infos:
            "L'Iron a apporté plus que du succès au 883. Il lui a aussi donné de l'agressivité, un coté garage, brutal, métallique, une envie de plonger la mécanique dans l'insolence. Il fut une époque où le Sportster 883 voulait sombrer dans des fonds lugubres et inquiétants, peuplés des âmes d'encre, où le soleil noir grille la peau des Bikers pétris de songes et d'histoires.",
      ),
      Model(
        id: 'm16',
        brand: 'Harley Davidson',
        brandLogo: Image.asset('assets/brand_logos/Harley.png'),
        name: 'Road King',
        hp: '83',
        manufacturedDate: '2022',
        photo: Image.asset('assets/bike_models/roadKing.png'),
        infos:
            "La Road King s'est ouvert une nouvelle route avec le Milwaukee Eight. A déguster en version Standard ou Classic, en valises rigides ou souples, ce Tourer conjugue le voyage avec une certaine simplicité et un moteur plein de promesses. Une ode à route pour les amoureux de cet engin transpirant l'Amérique profonde. Elle laisse le soin aux autres modèles de la gamme Touring (Street Glide, Ultra Limited, Road Glide, etc...) d'user et abuser d'appendices pour parfaire le voyage. Plus humble, se voulant traditionnelle à la limite du dépouillement, la machine se prête à merveille au cruising, crinière protégée ou cheveux au vent ; le choix pouvant s'opérer en un instant avec le pare-brise facilement amovible.",
      ),
    ],
  ),
  Category(
    id: 'c9',
    title: 'KTM',
    color: Colors.orange.shade900,
    logo: Image.asset('assets/brand_logos/KTM.png'),
    models: [
      Model(
        id: 'm17',
        brand: 'KTM',
        brandLogo: Image.asset('assets/brand_logos/KTM.png'),
        name: 'SuperDuke R',
        hp: '180',
        manufacturedDate: '2022',
        photo: Image.asset('assets/bike_models/superDuke.png'),
        infos:
            "La plus monstrueuse des Duke reçoit de nouvelles couleurs pour 2022 et, surtout, une version EVO dotée de suspensions semi-actives. KTM est bien décidé à transformer sa 'bête' en missile tactique. A n'approcher que si on a du plutonium dans les veines. Car voici un mix autrichien pour se donner du tonus. Prenez deux bons pistons, genre 650 cm3 chacun. Placez-les en V de façon à faire un moteur bestial. Faire chauffer à feu doux jusqu'à passer les 80°. Assurez-vous de bien déconnecter le cerveau puis trouvez une route aussi tordue que la classe politique. Maintenant, prenez une inspiration énorme et gardez-vous d'approcher les 10 000 tr/mn...",
      ),
      Model(
        id: 'm18',
        brand: 'KTM',
        brandLogo: Image.asset('assets/brand_logos/KTM.png'),
        name: 'Super Adventure',
        hp: '160',
        manufacturedDate: '2022',
        photo: Image.asset('assets/bike_models/super adventure.png'),
        infos:
            "Cette KTM 1290 Super Adventure S correspond à la troisième évolution de ce gros trail puissant et technologique. La bête de Mattighofen évolue davantage sur le plan technique que d’un point de vue purement esthétique sur ce millésime. Même si l’œil aguerri du passionné KTM remarquera aussitôt le nouveau dessin du réservoir d’essence de 23 litres, désormais en trois parties, et dont les flancs descendent de part et d’autre du moteur à la manière de ce qui se fait sur la petite sœur 890. La silhouette reste toutefois moins extravagante que sur cette dernière.",
      ),
    ],
  ),
  Category(
    id: 'c10',
    title: 'BMW',
    color: Colors.indigo.shade900,
    logo: Image.asset('assets/brand_logos/BMW.png'),
    models: [
      Model(
        id: 'm19',
        brand: 'BMW',
        brandLogo: Image.asset('assets/brand_logos/BMW.png'),
        name: 'Nine-t',
        hp: '109',
        manufacturedDate: '2022',
        photo: Image.asset('assets/bike_models/nine-t.png'),
        infos:
            "Fer de lance et initiatrice de la gamme néo-rétro chez BMW, la R NineT continue à évoluer par petites touches. Les années la font progresser sans changer son design, son esprit, son inspiration et son public. 2021 lui a permis de conserver sa place. C’est la deuxième fois que le ‘vieux’ Boxer est retouché pour s’adapter aux normes. Mais plus profondément que lors du passage à E4. On reconnait ce travail à la tronche des cache-culasses. La NineT a perdu un petit cheval dans l’opération mais les 109 chevaux sont disponibles plus tôt (- 500 tr/mn). Le couple, inchangé à 11,8 mkg, voit sa disponibilité renforcé sur l’ensemble des régimes usuels.",
      ),
      Model(
        id: 'm20',
        brand: 'BMW',
        brandLogo: Image.asset('assets/brand_logos/BMW.png'),
        name: 'S1000RR',
        hp: '207',
        manufacturedDate: '2022',
        photo: Image.asset('assets/bike_models/s1000rr.png'),
        infos:
            "///M, Une lettre qui signifie tout chez BMW. Le sport, la compétition, des performances ahurissantes! Les voitures de série qui passent par la filiale Motorsport GmbH deviennent des missiles capables de rivaliser avec des Porsche, Aston Martin ou Jaguar. Les M3 et M5 sont les plus représentatives. A présent, une moto du constructeur allemand récupère ce blason de testostérone pour devenir un missile surperformé: la M 1000 RR.",
      ),
    ],
  ),
];
