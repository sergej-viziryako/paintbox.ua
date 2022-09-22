!function(t,e){"use strict";"function"==typeof define&&define.amd?define(["jquery"],e):"object"==typeof exports?module.exports=e(require("jquery")):t.SlideAccordion=e(jQuery)}(this,function(n){"use strict";var t,e,i="js-acc-hidden";function s(t){this.options=n.extend(!0,{allowClickWhenExpanded:!1,activeClass:"active",opener:".opener",slider:".slide",animSpeed:300,collapsible:!0,event:"click",scrollToActiveItem:{enable:!1,breakpoint:767,animSpeed:600,extraOffset:null}},t),this.init()}return s.prototype={init:function(){this.options.holder&&(this.findElements(),this.setStateOnInit(),this.attachEvents(),this.makeCallback("onInit"))},findElements:function(){this.$holder=n(this.options.holder).data("SlideAccordion",this),this.$items=this.$holder.find(":has("+this.options.slider+")")},setStateOnInit:function(){var t=this;this.$items.each(function(){n(this).hasClass(t.options.activeClass)||n(this).find(t.options.slider).addClass(i)})},attachEvents:function(){var o=this;this.accordionToggle=function(t){var e=jQuery(this).closest(o.$items),i=o.getActiveItem(e);o.options.allowClickWhenExpanded&&e.hasClass(o.options.activeClass)||(t.preventDefault(),o.toggle(e,i))},this.$items.on(this.options.event,this.options.opener,this.accordionToggle)},toggle:function(t,e){t.hasClass(this.options.activeClass)?this.options.collapsible&&this.hide(t):this.show(t),!t.is(e)&&e.length&&this.hide(e),this.makeCallback("beforeToggle")},show:function(t){var e=t.find(this.options.slider);t.addClass(this.options.activeClass),e.stop().hide().removeClass(i).slideDown({duration:this.options.animSpeed,complete:function(){e.removeAttr("style"),this.options.scrollToActiveItem.enable&&window.innerWidth<=this.options.scrollToActiveItem.breakpoint&&this.goToItem(t),this.makeCallback("onShow",t)}.bind(this)}),this.makeCallback("beforeShow",t)},hide:function(t){var e=t.find(this.options.slider);t.removeClass(this.options.activeClass),e.stop().show().slideUp({duration:this.options.animSpeed,complete:function(){e.addClass(i),e.removeAttr("style"),this.makeCallback("onHide",t)}.bind(this)}),this.makeCallback("beforeHide",t)},goToItem:function(t){var e=t.offset().top;e<n(window).scrollTop()&&("number"==typeof this.options.scrollToActiveItem.extraOffset?e-=this.options.scrollToActiveItem.extraOffset:"function"==typeof this.options.scrollToActiveItem.extraOffset&&(e-=this.options.scrollToActiveItem.extraOffset()),n("body, html").animate({scrollTop:e},this.options.scrollToActiveItem.animSpeed))},getActiveItem:function(t){return t.siblings().filter("."+this.options.activeClass)},makeCallback:function(t){if("function"==typeof this.options[t]){var e=Array.prototype.slice.call(arguments);e.shift(),this.options[t].apply(this,e)}},destroy:function(){this.$holder.removeData("SlideAccordion"),this.$items.off(this.options.event,this.options.opener,this.accordionToggle),this.$items.removeClass(this.options.activeClass).each(function(t,e){n(e).find(this.options.slider).removeAttr("style").removeClass(i)}.bind(this)),this.makeCallback("onDestroy")}},n.fn.slideAccordion=function(e){var i=Array.prototype.slice.call(arguments),o=i[0];return this.each(function(){var t=jQuery(this).data("SlideAccordion");"object"==typeof e||void 0===e?new s(n.extend(!0,{holder:this},e)):"string"==typeof o&&t&&"function"==typeof t[o]&&(i.shift(),t[o].apply(t,i))})},t=n('<style type="text/css">')[0],e="."+i,e+="{position:absolute !important;left:-9999px !important;top:-9999px !important;display:block !important; width: 100% !important;}",t.styleSheet?t.styleSheet.cssText=e:t.appendChild(document.createTextNode(e)),n("head").append(t),s}),window.ResponsiveHelper=function(i){var a,e=[],o=i(window),l=!1;function s(){var t=o.width();t!==a&&(a=t,i.each(e,function(t,e){i.each(e.data,function(t,e){e.currentActive&&!n(e.range[0],e.range[1])&&(e.currentActive=!1,"function"==typeof e.disableCallback&&e.disableCallback())}),i.each(e.data,function(t,e){!e.currentActive&&n(e.range[0],e.range[1])&&(e.currentActive=!0,"function"==typeof e.enableCallback&&e.enableCallback())})}))}function n(t,e){var i,o,n,s="";return 0<t&&(s+="(min-width: "+t+"px)"),e<1/0&&(s+=(s?" and ":"")+"(max-width: "+e+"px)"),i=s,o=t,n=e,window.matchMedia&&l?matchMedia(i).matches:window.styleMedia?styleMedia.matchMedium(i):window.media?media.matchMedium(i):o<=a&&a<=n}return window.matchMedia&&(window.Window&&window.matchMedia===Window.prototype.matchMedia?l=!0:-1<window.matchMedia.toString().indexOf("native")&&(l=!0)),o.bind("load resize orientationchange",s),{addRange:function(t){var n={data:{}};i.each(t,function(t,e){var i,o;n.data[t]={range:(i=t,o=i.split(".."),[parseInt(o[0],10)||-1/0,parseInt(o[1],10)||1/0].sort(function(t,e){return t-e})),enableCallback:e.on,disableCallback:e.off}}),e.push(n),a=null,s()}}}(jQuery);