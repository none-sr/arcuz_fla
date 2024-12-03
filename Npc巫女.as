class Npc巫女 extends Npc
{
   var npcName;
   var questId;
   var subQuestId;
   var goods;
   var str;
   var chapter;
   var phase;
   var speech;
   var keyD;
   var onEnterFrame;
   function Npc巫女()
   {
      super();
      if(this._name.slice(0,8) != "instance")
      {
         this.npcName = _root.textNpcName[2][_root.lang];
         this.setDlg();
         this.updateSpeech();
         this.questId = [];
         this.questId[1] = [];
         this.questId[1][3] = 1;
         this.questId[3] = [];
         this.questId[3][6] = 1;
         this.subQuestId = [];
         this.subQuestId[2] = 2;
         this.updateStore();
      }
   }
   function updateStore()
   {
      var _loc8_ = _root.game.map.player.chapter;
      var _loc9_ = _root.game.map.player.phase;
      this.goods = [];
      if(_loc8_ == 0 && _loc9_ == 7)
      {
         this.goods[0] = new Potion("potion1");
         this.goods[1] = new Potion("potion1");
         this.goods[2] = new Potion("potion1");
         this.goods[3] = new Potion("potion1");
         this.goods[4] = new Potion("potion1");
      }
      if(_loc8_ > 0)
      {
         switch(_loc8_)
         {
            case 4:
            case 5:
            case 3:
               var _loc0_ = null;
               this.goods[4] = _loc0_ = new Potion("potion1");
               this.goods[3] = _loc0_;
               this.goods[2] = _loc0_;
               this.goods[1] = _loc0_;
               this.goods[0] = _loc0_;
               this.goods[9] = _loc0_ = new Potion("potion2");
               this.goods[8] = _loc0_;
               this.goods[7] = _loc0_;
               this.goods[6] = _loc0_;
               this.goods[5] = _loc0_;
               this.goods[14] = _loc0_ = new Potion("potion3");
               this.goods[13] = _loc0_;
               this.goods[12] = _loc0_;
               this.goods[11] = _loc0_;
               this.goods[10] = _loc0_;
               this.goods[19] = _loc0_ = new Potion("potion4");
               this.goods[18] = _loc0_;
               this.goods[17] = _loc0_;
               this.goods[16] = _loc0_;
               this.goods[15] = _loc0_;
               this.goods[24] = _loc0_ = new Potion("potion5");
               this.goods[23] = _loc0_;
               this.goods[22] = _loc0_;
               this.goods[21] = _loc0_;
               this.goods[20] = _loc0_;
               this.goods[29] = _loc0_ = new Potion("potion6");
               this.goods[28] = _loc0_;
               this.goods[27] = _loc0_;
               this.goods[26] = _loc0_;
               this.goods[25] = _loc0_;
               break;
            case 2:
               this.goods[4] = _loc0_ = new Potion("potion1");
               this.goods[3] = _loc0_;
               this.goods[2] = _loc0_;
               this.goods[1] = _loc0_;
               this.goods[0] = _loc0_;
               this.goods[9] = _loc0_ = new Potion("potion2");
               this.goods[8] = _loc0_;
               this.goods[7] = _loc0_;
               this.goods[6] = _loc0_;
               this.goods[5] = _loc0_;
               this.goods[14] = _loc0_ = new Potion("potion4");
               this.goods[13] = _loc0_;
               this.goods[12] = _loc0_;
               this.goods[11] = _loc0_;
               this.goods[10] = _loc0_;
               this.goods[19] = _loc0_ = new Potion("potion5");
               this.goods[18] = _loc0_;
               this.goods[17] = _loc0_;
               this.goods[16] = _loc0_;
               this.goods[15] = _loc0_;
               break;
            case 1:
               this.goods[4] = _loc0_ = new Potion("potion1");
               this.goods[3] = _loc0_;
               this.goods[2] = _loc0_;
               this.goods[1] = _loc0_;
               this.goods[0] = _loc0_;
               this.goods[9] = _loc0_ = new Potion("potion4");
               this.goods[8] = _loc0_;
               this.goods[7] = _loc0_;
               this.goods[6] = _loc0_;
               this.goods[5] = _loc0_;
         }
         this.goods.push(new Potion("potion13"));
         this.goods.push(new Potion("potion14"));
         this.goods.push(new Potion("potion15"));
         this.goods.push(new Potion("potion16"));
         this.goods.push(new Potion("potion17"));
         this.goods.push(new Potion("potion18"));
         this.goods.push(new Teleporter());
         this.goods.push(new Teleporter());
         var _loc7_ = random(5);
         var _loc4_ = 0;
         while(_loc4_ < _loc7_)
         {
            if(!random(5))
            {
               var _loc3_ = random(100);
               if(_loc3_ < 5)
               {
                  var _loc5_ = 3;
               }
               else if(_loc3_ < 20)
               {
                  _loc5_ = 2;
               }
               else
               {
                  _loc5_ = 1;
               }
               switch(random(5))
               {
                  case 0:
                     var _loc6_ = "fc";
                     break;
                  case 1:
                     _loc6_ = "wdc";
                     break;
                  case 2:
                     _loc6_ = "ec";
                     break;
                  case 3:
                     _loc6_ = "wc";
                     break;
                  case 4:
                     _loc6_ = "stone";
               }
               this.goods.push(new Crystal(_loc6_ + _loc5_));
            }
            _loc4_ = _loc4_ + 1;
         }
      }
   }
   function setDlg()
   {
      this.npcName = _root.textNpcName[2][_root.lang];
      this.str = [];
      this.str[0] = [];
      this.str[0][0] = [[_root.textNpc3[0][_root.lang]]];
      if(this.ifEmptyStore() == false)
      {
         this.str[0][7] = [[_root.textNpc3[1][_root.lang]]];
      }
      else
      {
         this.str[0][7] = [[_root.textNpc3[2][_root.lang],_root.textNpc3[3][_root.lang]]];
      }
      this.str[0][8] = this.str[0][9] = this.str[0][10] = [[_root.textNpc3[2][_root.lang],_root.textNpc3[3][_root.lang]]];
      if(_root.game.map.player.chapter == 0 && _root.game.map.player.phase == 13)
      {
         for(var _loc4_ in _root.game.map.player.inventoryList)
         {
            if(_root.game.map.player.inventoryList[_loc4_].Type == "Weapon")
            {
               if(_root.game.map.player.inventoryList[_loc4_].attrib[5] == 1)
               {
                  var _loc3_ = true;
                  break;
               }
            }
         }
         if(_loc3_)
         {
            this.str[0][13] = [[_root.textNpc3[4][_root.lang]]];
         }
         else
         {
            this.str[0][13] = [[_root.textNpc3[5][_root.lang]]];
         }
      }
      this.str[0][13] = [[_root.textNpc3[5][_root.lang]]];
      this.str[1] = [];
      this.str[1][0] = [[_root.textNpc3[6][_root.lang],_root.textNpc3[7][_root.lang]],[_root.textNpc3[8][_root.lang],_root.textNpc3[9][_root.lang]]];
      this.str[2] = [];
      this.str[2][0] = [];
      this.str[2][0][0] = [_root.textNpc3[10][_root.lang],_root.textNpc3[11][_root.lang]];
      this.str[2][0][1] = [_root.textNpc3[12][_root.lang]];
      this.str[2][0][2] = [_root.textNpc3[13][_root.lang],_root.textNpc3[14][_root.lang],_root.textNpc3[15][_root.lang]];
      this.str[3] = [];
      this.str[3][0] = [];
      this.str[3][0][0] = [_root.textNpc3[16][_root.lang]];
      this.str[3][0][1] = [_root.textNpc3[17][_root.lang],_root.textNpc3[18][_root.lang]];
      this.str[4] = [];
      this.str[4][0] = [];
      if(_root.game.map.player.chapter == 4 && _root.game.map.player.phase >= 9)
      {
         this.str[4][0][0] = [_root.textNpc3[23][_root.lang]];
         this.str[4][0][1] = [_root.textNpc3[24][_root.lang]];
      }
      else
      {
         this.str[4][0][0] = [_root.textNpc3[19][_root.lang]];
         this.str[4][0][1] = [_root.textNpc3[20][_root.lang]];
         this.str[4][0][2] = [_root.textNpc3[21][_root.lang],_root.textNpc3[22][_root.lang]];
      }
      this.str[5] = [];
      this.str[6] = [];
      this.str[7] = [];
      this.str[8] = [];
      this.str[9] = [];
   }
   function updateSpeech()
   {
      if(this.ifEmptyStore() == false)
      {
         this.str[0][7] = [[_root.textNpc3[1][_root.lang]]];
      }
      else
      {
         this.str[0][7] = [[_root.textNpc3[2][_root.lang]]];
      }
      this.chapter = _root.game.map.player.chapter;
      this.phase = _root.game.map.player.phase;
      if(this.str[this.chapter][this.phase] == undefined)
      {
         this.speech = this.str[this.chapter][0];
      }
      else
      {
         this.speech = this.str[this.chapter][this.phase];
      }
   }
   function showStore()
   {
      if(!_root.ui.dlgSellStuff._x)
      {
         var _loc5_ = _root.ui.attachMovie("dlgSellStuff","dlgSellStuff",_root.ui.getNextHighestDepth(),{_x:50});
         if(!_root.ui.dlgInv._x)
         {
            _root.ui.newInv();
         }
         else
         {
            _root.ui.dlgInv.swapDepths(_root.ui.getNextHighestDepth());
            var _loc3_ = 10;
            while(_loc3_ < _root.game.map.player.inventoryList.length)
            {
               _root.ui["item" + _loc3_].swapDepths(_root.ui.getNextHighestDepth());
               _loc3_ = _loc3_ + 1;
            }
         }
         _loc5_.init("store");
         _loc5_.gotoAndStop(2);
         _loc5_.goods = this.goods;
         _root.ui.pointAndHint.removeMovieClip();
         var _loc6_ = _root.game.map.player.chapter;
         var _loc7_ = _root.game.map.player.phase;
         if(_loc6_ == 0 && _loc7_ == 7)
         {
            if(_root.hintOfDlg._x == undefined)
            {
               _root.attachMovie("hintOfDlg","hintOfDlg",_root.getNextHighestDepth());
            }
            _root.hintOfDlg.gotoAndStop(2);
         }
         _loc3_ = 0;
         while(_loc3_ < this.goods.length)
         {
            if(this.goods[_loc3_] != undefined)
            {
               var _loc4_ = _root.ui.attachMovie("item","storeItem" + _loc3_,_root.ui.getNextHighestDepth());
               _loc4_.storeItem = true;
               _loc4_.npc = this;
               _loc4_.setAttrib(this.goods[_loc3_]);
               _loc4_.setPosition(_loc3_);
            }
            _loc3_ = _loc3_ + 1;
         }
      }
   }
   function specialEnd()
   {
      var _loc4_ = _root.game.map.player.chapter;
      var _loc6_ = _root.game.map.player.phase;
      if(_loc4_ == 0 && _loc6_ == 13)
      {
         if(!_root.ui.dlgCompose._x)
         {
            _root.ui.pointAndHint.removeMovieClip();
            if(_root.hintOfDlg._x == undefined)
            {
               _root.attachMovie("hintOfDlg","hintOfDlg",_root.getNextHighestDepth());
            }
            _root.hintOfDlg.gotoAndStop(6);
            _root.ui.attachMovie("dlgCompose","dlgCompose",_root.ui.getNextHighestDepth(),{_x:50});
            if(!_root.ui.dlgInv._x)
            {
               _root.ui.newInv();
            }
            else
            {
               _root.ui.dlgInv.swapDepths(_root.ui.getNextHighestDepth());
               var _loc3_ = 10;
               while(_loc3_ < _root.game.map.player.inventoryList.length)
               {
                  _root.ui["item" + _loc3_].swapDepths(_root.ui.getNextHighestDepth());
                  _loc3_ = _loc3_ + 1;
               }
            }
         }
         return true;
      }
      if(_loc4_ > 0)
      {
         var _loc5_ = [_root.textNpc3[25][_root.lang]];
         _root.ui.dialog.init2(this.npcName,_loc5_);
         _root.ui.dialog.keyD = true;
         _root.ui.dialog.onEnterFrame = function()
         {
            if(Key.isDown(74) || _root.mouseCursor.down)
            {
               if(!this.keyD || _root.mouseCursor.down)
               {
                  _root.mouseCursor.down = false;
                  this.keyD = true;
                  if(!_root.ui.dlgCompose._x)
                  {
                     _root.game.map.npc3.showStore();
                  }
                  this.onEnterFrame = undefined;
               }
            }
            else if(Key.isDown(75))
            {
               if(!this.keyD)
               {
                  this.keyD = true;
                  if(!_root.ui.dlgCompose._x && !_root.ui.dlgSellStuff._x)
                  {
                     _root.ui.attachMovie("dlgCompose","dlgCompose",_root.ui.getNextHighestDepth(),{_x:50});
                     if(!_root.ui.dlgInv._x)
                     {
                        _root.ui.newInv();
                     }
                     else
                     {
                        _root.ui.dlgInv.swapDepths(_root.ui.getNextHighestDepth());
                        var _loc3_ = 10;
                        while(_loc3_ < _root.game.map.player.inventoryList.length)
                        {
                           _root.ui["item" + _loc3_].swapDepths(_root.ui.getNextHighestDepth());
                           _loc3_ = _loc3_ + 1;
                        }
                     }
                  }
                  this.onEnterFrame = undefined;
               }
            }
            else if(Key.isDown(27))
            {
               if(!this.keyD)
               {
                  this.keyD = true;
                  _root.ui.dialog.closeDlg();
                  return false;
               }
            }
            else
            {
               this.keyD = false;
            }
         };
         return true;
      }
      return false;
   }
   function checkPastSecQuest()
   {
      if(_root.game.map.player.chapter > 2)
      {
         if(_root.game.map.player.secondaryQuest[2][2] == 2)
         {
            return _root.sQuest[2][2];
         }
      }
      return false;
   }
}
