!function(t,e){"function"==typeof define&&define.amd?define("simple-hotkeys",["jquery","simple-module"],function(o,r){return t.hotkeys=e(o,r)}):"object"==typeof exports?module.exports=e(require("jquery"),require("simplemodule")):(t.simple=t.simple||{},t.simple.hotkeys=e(jQuery,SimpleModule))}(this,function(t,e){var o,r,n=function(t,e){function o(){this.constructor=t}for(var r in e)i.call(e,r)&&(t[r]=e[r]);return o.prototype=e.prototype,t.prototype=new o,t.__super__=e.prototype,t},i={}.hasOwnProperty;return o=function(e){function o(){return o.__super__.constructor.apply(this,arguments)}return n(o,e),o.count=0,o.keyNameMap={8:"Backspace",9:"Tab",13:"Enter",16:"Shift",17:"Control",18:"Alt",19:"Pause",20:"CapsLock",27:"Esc",32:"Spacebar",33:"PageUp",34:"PageDown",35:"End",36:"Home",37:"Left",38:"Up",39:"Right",40:"Down",45:"Insert",46:"Del",91:"Meta",93:"Meta",48:"0",49:"1",50:"2",51:"3",52:"4",53:"5",54:"6",55:"7",56:"8",57:"9",65:"A",66:"B",67:"C",68:"D",69:"E",70:"F",71:"G",72:"H",73:"I",74:"J",75:"K",76:"L",77:"M",78:"N",79:"O",80:"P",81:"Q",82:"R",83:"S",84:"T",85:"U",86:"V",87:"W",88:"X",89:"Y",90:"Z",96:"0",97:"1",98:"2",99:"3",100:"4",101:"5",102:"6",103:"7",104:"8",105:"9",106:"Multiply",107:"Add",109:"Subtract",110:"Decimal",111:"Divide",112:"F1",113:"F2",114:"F3",115:"F4",116:"F5",117:"F6",118:"F7",119:"F8",120:"F9",121:"F10",122:"F11",123:"F12",124:"F13",125:"F14",126:"F15",127:"F16",128:"F17",129:"F18",130:"F19",131:"F20",132:"F21",133:"F22",134:"F23",135:"F24",59:";",61:"=",186:";",187:"=",188:",",190:".",191:"/",192:"`",219:"[",220:"\\",221:"]",222:"'"},o.aliases={escape:"esc","delete":"del","return":"enter",ctrl:"control",space:"spacebar",ins:"insert",cmd:"meta",command:"meta",wins:"meta",windows:"meta"},o.normalize=function(t){var e,o,r,n,i,s;for(i=t.toLowerCase().replace(/\s+/gi,"").split("+"),e=o=0,s=i.length;s>o;e=++o)r=i[e],i[e]=this.aliases[r]||r;return n=i.pop(),i.sort().push(n),i.join("_")},o.prototype.opts={el:document},o.prototype._init=function(){return this.id=++this.constructor.count,this._map={},this._delegate="string"==typeof this.opts.el?document:this.opts.el,t(this._delegate).on("keydown.simple-hotkeys-"+this.id,this.opts.el,function(t){return function(e){var o;return null!=(o=t._getHander(e))?o.call(t,e):void 0}}(this))},o.prototype._getHander=function(t){var e,o;if(e=this.constructor.keyNameMap[t.which])return o="",t.altKey&&(o+="alt_"),t.ctrlKey&&(o+="control_"),t.metaKey&&(o+="meta_"),t.shiftKey&&(o+="shift_"),o+=e.toLowerCase(),this._map[o]},o.prototype.respondTo=function(t){return"string"==typeof t?null!=this._map[this.constructor.normalize(t)]:null!=this._getHander(t)},o.prototype.add=function(t,e){return this._map[this.constructor.normalize(t)]=e,this},o.prototype.remove=function(t){return delete this._map[this.constructor.normalize(t)],this},o.prototype.destroy=function(){return t(this._delegate).off(".simple-hotkeys-"+this.id),this._map={},this},o}(e),r=function(t){return new o(t)}});