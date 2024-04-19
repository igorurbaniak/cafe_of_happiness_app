import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/domain/models/dish_model/dish_model.dart';

List<DishModel> dishes = [
  DishModel(
    id: 1,
    dishName: 'Wspomnienie znad morza',
    dishPrice: 28,
    dishIngredients:
        'croissant, łosoś, kremowy serek labne, pomidorki koktajlowe, kapary, rukola, sos cytrynowy, smażone nasiona',
    cookTime: 13,
    dishImage: 'images/1.jpg',
    isVegetarian: false,
    isRecommended: true,
    isNew: false,
    dishCategory: DishCategory.breakfast,
    categories: ['m1'],
  ),
  DishModel(
    id: 2,
    dishName: 'Rozkosz w ustach',
    dishPrice: 22,
    dishIngredients:
        'croissant, prosciutto, serek śmietankowy, gruszka, ser pleśniowy blue, rukola, pesto, oliwa',
    cookTime: 13,
    dishImage: 'images/2.jpg',
    isVegetarian: true,
    isRecommended: true,
    isNew: false,
    dishCategory: DishCategory.breakfast,
    categories: ['m1'],
  ),
  DishModel(
    id: 3,
    dishName: 'Wegetariańska radość',
    dishPrice: 25,
    dishIngredients:
        'grzanka lub croissant (nie wegański), guacamole, czosnek, mieszanka nasion, ogórek, pomidor, rukola, oliwa',
    cookTime: 10,
    dishImage: 'images/3.jpg',
    isVegetarian: true,
    isRecommended: true,
    isNew: true,
    dishCategory: DishCategory.breakfast,
    categories: ['m1'],
  ),
  DishModel(
    id: 4,
    dishName: 'Dzień dobry po angielsku',
    dishPrice: 25,
    dishIngredients:
        'jajecznica, frankfurterki, boczek, fasolka w sosie pomidorowym, chleb, warzywa (masło, ketchup i musztarda na życzenie)',
    cookTime: 22,
    dishImage: 'images/4.jpg',
    isVegetarian: false,
    isRecommended: true,
    isNew: true,
    dishCategory: DishCategory.breakfast,
    categories: ['m1'],
  ),
  DishModel(
    id: 5,
    dishName: 'Szwedzki stół',
    dishPrice: 32,
    dishIngredients:
        '2 grzanki, ser Gouda, ugotowane jajko, łosoś (lub prosciutto), warzywa, zielenina',
    cookTime: 14,
    dishImage: 'images/5.jpg',
    isVegetarian: true,
    isRecommended: false,
    isNew: false,
    dishCategory: DishCategory.breakfast,
    categories: ['m1'],
  ),
  DishModel(
    id: 6,
    dishName: 'Owsianka na słono',
    dishPrice: 27,
    dishIngredients:
        'Słona owsianka z serem parmezanem, ugotowanym jajkiem, awokado i pomidorkami.',
    cookTime: 19,
    dishImage: 'images/6.jpg',
    isVegetarian: true,
    isRecommended: true,
    isNew: false,
    dishCategory: DishCategory.breakfast,
    categories: ['m1'],
  ),
  DishModel(
    id: 7,
    dishName: 'Małe cudowności',
    dishPrice: 32,
    dishIngredients:
        'Słowiańskie ravioli (pelmeni) z trzech rodzajów mięsa: kurczak, wołowina, wieprzowina. ',
    cookTime: 16,
    dishImage: 'images/7.jpg',
    isVegetarian: true,
    isRecommended: false,
    isNew: true,
    dishCategory: DishCategory.lunch,
    categories: ['m1'],
  ),
  DishModel(
    id: 8,
    dishName: 'Powrót do dzieciństwa',
    dishPrice: 30,
    dishIngredients:
        'Słowiańskie kolorowe ravioli (pelmeni) z kurczakiem i naturalnymi barwnikami (burak, szpinak, marchewka',
    cookTime: 12,
    dishImage: 'images/8.jpg',
    isVegetarian: false,
    isRecommended: true,
    isNew: false,
    dishCategory: DishCategory.lunch,
    categories: ['m1'],
  ),
  DishModel(
    id: 9,
    dishName: 'Zdrowy vibe',
    dishPrice: 38,
    dishIngredients:
        'bajgiel, guacamole, łosoś,jajko po benedyktyńsku, warzywa, zielenina',
    cookTime: 10,
    dishImage: 'images/9.jpg',
    isVegetarian: true,
    isRecommended: true,
    isNew: false,
    dishCategory: DishCategory.lunch,
    categories: ['m3'],
  ),
  DishModel(
    id: 10,
    dishName: 'Pyszne chwile (kurczak)',
    dishPrice: 28,
    dishIngredients: '(2 szt) Naleśniki z kurczakiem i pieczarkami',
    cookTime: 15,
    dishImage: 'images/10.jpg',
    isVegetarian: false,
    isRecommended: false,
    isNew: false,
    dishCategory: DishCategory.lunch,
    categories: ['m3'],
  ),
  DishModel(
    id: 11,
    dishName: 'Słodki uśmiech',
    dishPrice: 18,
    dishIngredients: 'croissant, dżem, ser śmietankowo-kremowy',
    cookTime: 17,
    dishImage: 'images/11.jpg',
    isVegetarian: true,
    isRecommended: true,
    isNew: true,
    dishCategory: DishCategory.sweet,
    categories: ['m3'],
  ),
  DishModel(
    id: 12,
    dishName: 'Francuski pocałunek',
    dishPrice: 29,
    dishIngredients:
        'chałka własnej roboty, cynamon, mieszanka malinowo-cukrowa, jogurt i miód',
    cookTime: 12,
    dishImage: 'images/12.jpg',
    isVegetarian: false,
    isRecommended: true,
    isNew: false,
    dishCategory: DishCategory.sweet,
    categories: ['m4'],
  ),
  DishModel(
    id: 13,
    dishName: 'Miłość od pierwszego kęsa',
    dishPrice: 40,
    dishIngredients:
        'serniczki twarogowe, sos jagodowo-jogurtowy, cukier puder',
    cookTime: 22,
    dishImage: 'images/13.jpg',
    isVegetarian: true,
    isRecommended: true,
    isNew: false,
    dishCategory: DishCategory.sweet,
    categories: ['m4'],
  ),
  DishModel(
    id: 14,
    dishName: 'Owocowe szczęście',
    dishPrice: 26,
    dishIngredients:
        'serniczki twarogowe, sos jagodowo-jogurtowy, cukier puder',
    cookTime: 8,
    dishImage: 'images/14.jpg',
    isVegetarian: true,
    isRecommended: true,
    isNew: false,
    dishCategory: DishCategory.sweet,
    categories: ['m4'],
  ),
  DishModel(
    id: 15,
    dishName: 'Lody dla ochłody',
    dishPrice: 14,
    dishIngredients:
        'lody ala straciatella w owocowym puree na malinach i borówkach',
    cookTime: 6,
    dishImage: 'images/15.jpg',
    isVegetarian: false,
    isRecommended: true,
    isNew: false,
    dishCategory: DishCategory.sweet,
    categories: ['m4'],
  ),
  DishModel(
    id: 16,
    dishName: 'Truskawki',
    dishPrice: 12,
    dishIngredients: 'swieżo zerwane truskawki z własnej pielegnacji',
    cookTime: 4,
    dishImage: 'images/16.jpg',
    isVegetarian: true,
    isRecommended: false,
    isNew: false,
    dishCategory: DishCategory.sweet,
    categories: ['m5'],
  ),
  DishModel(
    id: 17,
    dishName: 'Pyszne chwile (szpinak)',
    dishPrice: 22,
    dishIngredients: '(2 szt) Naleśniki ze szpinakiem i serem philadelphia ',
    cookTime: 12,
    dishImage: 'images/17.jpg',
    isVegetarian: true,
    isRecommended: false,
    isNew: false,
    dishCategory: DishCategory.lunch,
    categories: ['m5'],
  ),
  DishModel(
    id: 18,
    dishName: 'Pyszne chwile (bryndza)',
    dishPrice: 31,
    dishIngredients:
        '(2 szt) Naleśniki z bryndzy. Smak bryndzy jest intensywny, słony, wyrazisty i często lekko kwaśny. ',
    cookTime: 15,
    dishImage: 'images/18.jpg',
    isVegetarian: true,
    isRecommended: true,
    isNew: false,
    dishCategory: DishCategory.lunch,
    categories: ['m5'],
  ),
  DishModel(
    id: 19,
    dishName: 'Sałatka z łososiem',
    dishPrice: 22,
    dishIngredients:
        'Sałatka z rukolą, łososiem, pomidorki, ocet balsamiczny, nasiona, chlebek',
    cookTime: 11,
    dishImage: 'images/19.jpg',
    isVegetarian: false,
    isRecommended: true,
    isNew: false,
    dishCategory: DishCategory.lunch,
    categories: ['m5'],
  ),
  DishModel(
    id: 20,
    dishName: 'Sałatka z kurczakiem',
    dishPrice: 35,
    dishIngredients: 'Mix sałatek, kurczak, parmezan, warzywa',
    cookTime: 15,
    dishImage: 'images/20.jpg',
    isVegetarian: false,
    isRecommended: false,
    isNew: false,
    dishCategory: DishCategory.lunch,
    categories: ['m6'],
  ),
  DishModel(
    id: 21,
    dishName: 'Zupa dnia',
    dishPrice: 16,
    dishIngredients: 'Codziennie inna zupa, proszę pytać przy barze',
    cookTime: 6,
    dishImage: 'images/21.jpg',
    isVegetarian: false,
    isRecommended: true,
    isNew: false,
    dishCategory: DishCategory.lunch,
    categories: ['m6'],
  ),
  DishModel(
    id: 22,
    dishName: 'Cappuccino',
    dishPrice: 17,
    dishIngredients: 'swiezo palona kawaka z serca mleczkiem',
    cookTime: 6,
    dishImage: 'images/22.jpg',
    isVegetarian: false,
    isRecommended: true,
    isNew: false,
    dishCategory: DishCategory.coffee,
    categories: ['m2'],
  ),
  DishModel(
    id: 23,
    dishName: 'Latte',
    dishPrice: 15,
    dishIngredients: 'kawa barzylijka ziarnista z mleczna pianką',
    cookTime: 5,
    dishImage: 'images/23.jpg',
    isVegetarian: false,
    isRecommended: true,
    isNew: false,
    dishCategory: DishCategory.coffee,
    categories: ['m2'],
  ),
  DishModel(
    id: 24,
    dishName: 'Americano',
    dishPrice: 12,
    dishIngredients: '70ml kawy z dodatkiem miodu',
    cookTime: 4,
    dishImage: 'images/24.jpg',
    isVegetarian: false,
    isRecommended: true,
    isNew: false,
    dishCategory: DishCategory.coffee,
    categories: ['m2'],
  ),
  DishModel(
    id: 25,
    dishName: 'Herbata zielona',
    dishPrice: 8,
    dishIngredients: 'zielona herbata cytronowo-miętowa',
    cookTime: 5,
    dishImage: 'images/26.jpg',
    isVegetarian: false,
    isRecommended: true,
    isNew: false,
    dishCategory: DishCategory.tea,
    categories: ['m2'],
  ),
  DishModel(
    id: 26,
    dishName: 'Mleko',
    dishPrice: 10,
    dishIngredients: 'swieze mleczko (mozna podgrzac)',
    cookTime: 2,
    dishImage: 'images/25.jpg',
    isVegetarian: false,
    isRecommended: false,
    isNew: true,
    dishCategory: DishCategory.other,
    categories: ['m2'],
  ),
];
