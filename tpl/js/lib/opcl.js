!function(n){function a(e){this.options=n.extend({addClassBeforeAnimation:!0,hideOnClickOutside:!1,activeClass:"active",opener:".opener",slider:".slide",animSpeed:400,effect:"fade",event:"click"},e),this.init()}a.prototype={init:function(){this.options.holder&&(this.findElements(),this.attachEvents(),this.makeCallback("onInit",this))},findElements:function(){this.holder=n(this.options.holder),this.opener=this.holder.find(this.options.opener),this.slider=this.holder.find(this.options.slider)},attachEvents:function(){var o=this;this.eventHandler=function(e){e.preventDefault(),o.slider.hasClass(i)?o.showSlide():o.hideSlide()},o.opener.on(o.options.event,this.eventHandler),"hover"===o.options.event&&(o.opener.on("mouseenter",function(){o.holder.hasClass(o.options.activeClass)||o.showSlide()}),o.holder.on("mouseleave",function(){o.hideSlide()})),o.outsideClickHandler=function(e){var t;o.options.hideOnClickOutside&&((t=n(e.target)).is(o.holder)||t.closest(o.holder).length||o.hideSlide())},this.holder.hasClass(this.options.activeClass)?n(document).on("click touchstart",o.outsideClickHandler):this.slider.addClass(i)},showSlide:function(){var e=this;e.options.addClassBeforeAnimation&&e.holder.addClass(e.options.activeClass),e.slider.removeClass(i),n(document).on("click touchstart",e.outsideClickHandler),e.makeCallback("animStart",!0),o[e.options.effect].show({box:e.slider,speed:e.options.animSpeed,complete:function(){e.options.addClassBeforeAnimation||e.holder.addClass(e.options.activeClass),e.makeCallback("animEnd",!0)}})},hideSlide:function(){var e=this;e.options.addClassBeforeAnimation&&e.holder.removeClass(e.options.activeClass),n(document).off("click touchstart",e.outsideClickHandler),e.makeCallback("animStart",!1),o[e.options.effect].hide({box:e.slider,speed:e.options.animSpeed,complete:function(){e.options.addClassBeforeAnimation||e.holder.removeClass(e.options.activeClass),e.slider.addClass(i),e.makeCallback("animEnd",!1)}})},destroy:function(){this.slider.removeClass(i).css({display:""}),this.opener.off(this.options.event,this.eventHandler),this.holder.removeClass(this.options.activeClass).removeData("OpenClose"),n(document).off("click touchstart",this.outsideClickHandler)},makeCallback:function(e){var t;"function"==typeof this.options[e]&&((t=Array.prototype.slice.call(arguments)).shift(),this.options[e].apply(this,t))}};var e,t,i="js-slide-hidden";e=n('<style type="text/css">')[0],t="."+i,t+="{position:absolute !important;left:-9999px !important;top:-9999px !important;display:block !important}",e.styleSheet?e.styleSheet.cssText=t:e.appendChild(document.createTextNode(t)),n("head").append(e);var o={slide:{show:function(e){e.box.stop(!0).hide().slideDown(e.speed,e.complete)},hide:function(e){e.box.stop(!0).slideUp(e.speed,e.complete)}},fade:{show:function(e){e.box.stop(!0).hide().fadeIn(e.speed,e.complete)},hide:function(e){e.box.stop(!0).fadeOut(e.speed,e.complete)}},none:{show:function(e){e.box.hide().show(0,e.complete)},hide:function(e){e.box.hide(0,e.complete)}}};n.fn.openClose=function(o){var i=Array.prototype.slice.call(arguments),s=i[0];return this.each(function(){var e=jQuery(this),t=e.data("OpenClose");"object"==typeof o||void 0===o?e.data("OpenClose",new a(n.extend({holder:this},o))):"string"==typeof s&&t&&"function"==typeof t[s]&&(i.shift(),t[s].apply(t,i))})}}(jQuery);