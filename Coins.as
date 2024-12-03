class Coins extends MovieClip
{
   var amount;
   var num;
   var count;
   var onEnterFrame;
   function Coins()
   {
      super();
   }
   function init(p)
   {
      this.amount = p;
      _root.playSound1("卖东西得金钱.wav");
      this.action();
      this.amount > 100 ? this.gotoAndStop(2) : this.gotoAndStop(1);
   }
   function init2(p)
   {
      this.amount = p;
      this.getCoins2();
   }
   function getCoins2()
   {
      _root.playSound1("卖东西得金钱.wav");
      this._parent.player.money += this.amount;
      this._y -= 15;
      this.num.text = this.amount;
      this.count = 35;
      this.onEnterFrame = function()
      {
         this._y -= 0.5;
         if(--this.count < 0)
         {
            this.removeMovieClip();
         }
      };
      this.gotoAndStop(3);
   }
   function getCoins()
   {
      _root.playSound1("卖东西得金钱.wav");
      this._parent.player.money += this.amount;
      this.count = 7;
      _root.shotShine2(this,"white",7);
      this.onEnterFrame = function()
      {
         if(--this.count < 0)
         {
            this.count = 30;
            this._y -= 15;
            this.num.text = this.amount;
            this.onEnterFrame = function()
            {
               this._y -= 0.5;
               if(--this.count < 0)
               {
                  this.removeMovieClip();
               }
            };
            §§push(this.gotoAndStop(3));
         }
      };
   }
   function action()
   {
      this.count = 30;
      this.onEnterFrame = function()
      {
         if(this.count > 0)
         {
            this.count = this.count - 1;
         }
         else if(this._parent._parent.getDis(this._x,this._y,this._parent.player._x,this._parent.player._y) < 50)
         {
            this.getCoins();
         }
      };
   }
}
