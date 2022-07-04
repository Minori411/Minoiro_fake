/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/plan.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/plan.js":
/*!**************************************!*\
  !*** ./app/javascript/packs/plan.js ***!
  \**************************************/
/*! no static exports found */
/***/ (function(module, exports) {

document.addEventListener("turbolinks:load", function () {
  $(function () {
    function buildField(index) {
      var html = "<div class=\"boxbaseP30 plan_module flex-wrap planbox m-b-20 z-depth-1 js-addfield-block\" data-index=\"".concat(index, "\", style=\"padding: 30px\">\n        <div class=\"left \">\n        <input placeholder=\"\u30C1\u30E3\u30C3\u30C8\u3067\u306E\u76F8\u8AC7\" type=\"text\" name=\"plan[plans][plan_name]\" id=\"plan_plans_plan_name\">      \n        </div>\n    \n        <div class=\"pricebox \">\n        <input placeholder=\"5,000\" type=\"text\" name=\"plan[plans][price]\" id=\"plan_plans_price\">\n          <div class=\"yenkais\">\n            <span class=\"yenkai\">\u5186/</span>\n            <span class=\"kai\">\u56DE</span>\n            </div>\n        </div>\n    \n    \n        <div class=\"items\">\n            <div class=\"item_name flexbox\">\n                <h3>\u76F8\u8AC7\u65B9\u5F0F</h3><span class=\"optional_label\">\u4EFB\u610F</span>\n            </div>\n            <input id=\"minoiro_checkbox\" as=\"boolean\" type=\"checkbox\" value=\"1\" name=\"plan[plans][chat]\">\n            <label for=\"plan_\u30C1\u30E3\u30C3\u30C8\">\u30C1\u30E3\u30C3\u30C8</label>\n            <input id=\"minoiro_video\" as=\"boolean\" type=\"checkbox\" value=\"1\" name=\"plan[plans][video]\">              \n            <label for=\"plan_\u30D3\u30C7\u30AA\u901A\u8A71\">\u30D3\u30C7\u30AA\u901A\u8A71</label>\n          </div>\n    \n        <div class=\"m-t2 left w100p \">\n        <textarea class=\"w100p\" placeholder=\"\u30D7\u30E9\u30F3\u306E\u5185\u5BB9\u3092\u5165\u529B\u3057\u3066\u304F\u3060\u3055\u3044\" name=\"plan[plans][plan_detail]\" id=\"plan_plans_plan_detail\"></textarea>\n      </div>\n          <div class=\"right m-b-20 smt_right m-t1\" style=\"width: auto; margin-left: auto;\">\n          <a class=\"button hidden-destroy\" data-deletefiled=\"true\">\n              <i class=\"fas fa-times-circle\"></i> \u524A\u9664\n          </a>");
      return html;
    }

    var fileIndex = [1, 2, 3, 4];
    var lastIndex = $(".certi-ficate:last").data("index");
    fileIndex.splice(0, lastIndex);
    var fileCount = $(".hidden-destroy").length;
    var displayCount = $(".certi-ficate").length;
    $(".hidden-destroy").hide();
    if (fileIndex.length == 0) $(".add-form-btn").css("display", "none");
    $(".add-form-btn").on("click", function (event) {
      event.preventDefault();
      console.log("リンク先への遷移をストップ");
      $(".plan_area").append(buildField(fileIndex[0]));
      fileIndex.shift();
      if (fileIndex.length == 0) $(".add-form-btn").css("display", "none");
      displayCount += 1;
    });
  });
});

/***/ })

/******/ });
//# sourceMappingURL=plan-7ae1a982789f523556bd.js.map