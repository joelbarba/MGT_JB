import angular from 'angular';
import angularMeteor from 'angular-meteor';
 



angular.module('MMain', [angularMeteor]);





angular.module('MMain').controller('CMain', ['$scope', function($scope) {

  $scope.var1 = 'primer valor';
  $scope.activar = function() { $scope.var1 = 'segon valor'; }

	
  //-------- 0          1       2        3        4      5
  colors = ['uncolor', 'blue', 'white', 'black', 'red', 'green'];
  //------------ 0             1                2
  card_types = ['basic land', 'instant spell', 'creature'];
  //------------- 0         1        2       3          4         5          6
  game_phases = ['upkeep', 'untap', 'take', 'summon1', 'attack', 'summon2', 'end'];
  //------------- 0       1       2         3        4            5
  card_places = ['deck', 'hand', 'summon', 'table', 'graveyard', 'discarted'];


  $scope.all_cards = [];
  Card_templates.find({}).forEach(function(card) { 
    console.log(card);
    $scope.all_cards.push(card); 
  });
  console.log($scope.all_cards);


//  $scope.helpers({
//    all_cards() {
//      return Card_templates.find({});
//    }
//  });










}]);