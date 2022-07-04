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
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/profile.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/profile.js":
/*!*****************************************!*\
  !*** ./app/javascript/packs/profile.js ***!
  \*****************************************/
/*! no static exports found */
/***/ (function(module, exports) {

document.addEventListener("turbolinks:load", function () {
  $(function () {
    function buildField(index) {
      var html = "<div class=\"certificate1\" data-index=\"".concat(index, "\"> \n    <table class=\"editable\">\n        <tr>\n            <th width=\"150\">\u8CC7\u683C\u540D</th>\n            <td colspan=\"3\">\n                <div>\n                    <div class=\"certificate-input-root\">\n                        <div class=\"certificate-input-wrapper-default input\">\n                            <input class=\"w300\" placeholder=\"\u8CC7\u683C\u540D\" name=\"certificate\" type=\"text\">\n                        </div>\n                    </div>\n                </div>\n            </td>\n        </tr>\n        <tr class=\"consultant-info\">\n            <th>\u8CC7\u683C\u8A3C\u660E\u66F8</th>\n            <td>\n                <div class=\"certificate\">\n                <% if @user.certificate?%>\n                    <%= image_tag @user.certificate.url, id: :img_prev_2, class: :certificate_img %>\n                <% else%>\n                    <div>\u753B\u50CF\u304C\u3042\u308A\u307E\u305B\u3093</div>\n                <%end%>\n                </div>\n                <div class=\"upload m-t1\" data-thumbnail-target=\"#selected-file\">\n                    \u753B\u50CF\u3092\u30A2\u30C3\u30D7\u30ED\u30FC\u30C9\u3059\u308B\uFF08\u7E26\u6A2A200px\xD7200px\u4EE5\u4E0A\u63A8\u5968\u30015MB\u672A\u6E80)\n                    <div class=\"alignCenter m-t-20 m-b-20\">\n                    <input type=\"file\" name=\"user[certificate]\" id=\"user_certificate\">\n                    </div>\n                </div>\n                <span class=\"help-block m-t-5\"></span>\n            </td>\n        </tr>\n        </table>\n        <table>\n        <tr class=\"consultant-info\">\n            <th width=\"150\">\u30EC\u30D9\u30EB</th>\n            <td width=\"235\">\n                <div class=\"form-group\">\n                    <div class=\"select-wrap\">\n                        <select name=\"user[users][level]\" id=\"user_users_level\"><option value=\"\u9078\u629E\u3057\u3066\u304F\u3060\u3055\u3044\">\u9078\u629E\u3057\u3066\u304F\u3060\u3055\u3044</option>\n                        <option value=\"\u2605 \u521D\u5FC3\u8005\">\u2605 \u521D\u5FC3\u8005</option>\n                        <option value=\"\u2605\u2605 \u521D\u7D1A\">\u2605\u2605 \u521D\u7D1A</option>\n                        <option value=\"\u2605\u2605\u2605 \u521D\u4E2D\u7D1A\">\u2605\u2605\u2605 \u521D\u4E2D\u7D1A</option>\n                        <option value=\"\u2605\u2605\u2605\u2605 \u4E2D\u7D1A\">\u2605\u2605\u2605\u2605 \u4E2D\u7D1A</option>\n                        <option value=\"\u2605\u2605\u2605\u2605\u2605 \u719F\u7DF4\">\u2605\u2605\u2605\u2605\u2605 \u719F\u7DF4</option></select>\n                    </div>\n                </div>\n            </td>\n            <th width=\"150\">\u7D4C\u9A13\u5E74\u6570</th>\n            <td width=\"235\">\n                <div class=\"form-group\">\n                    <div class=\"select-wrap\">\n                        <select name=\"user[users][level]\" id=\"user_users_level\"><option value=\"\u9078\u629E\u3057\u3066\u304F\u3060\u3055\u3044\">\u9078\u629E\u3057\u3066\u304F\u3060\u3055\u3044</option>\n                        <option value=\"\u534A\u5E74\u672A\u6E80\">\u534A\u5E74\u672A\u6E80</option>\n                        <option value=\"\u301C1\u5E74\">\u301C1\u5E74</option>\n                        <option value=\"\u301C3\u5E74\">\u301C3\u5E74</option>\n                        <option value=\"\u301C5\u5E74\">\u301C5\u5E74</option>\n                        <option value=\"5\u5E74\u301C\">5\u5E74\u301C</option></select>\n                    </div>\n                </div>\n            </td>\n        </tr>\n        <tr class=\"consultant-info\">\n            <td></td>\n            <td colspan=\"3\">\n                <span class=\"delete-form-btn\">\n                    <i class=\"fa fa-times red\"></i>\n                    \u524A\u9664\u3059\u308B\n                </span>\n                <input name=\"user[users][_destroy]\" type=\"hidden\" value=\"0\" autocomplete=\"off\">\n                <input class=\"hidden-destroy\" type=\"checkbox\" value=\"1\" name=\"user[users][_destroy]\" id=\"user_users__destroy\" style=\"display: none;\">\n            </td>\n        </tr>\n    </table>\n    </div>");
      return html;
    }

    var fileIndex = [1, 2, 3, 4];
    var lastIndex = $(".certificate1:last").data("index");
    fileIndex.splice(0, lastIndex);
    var fileCount = $(".hidden-destroy").length;
    var displayCount = $(".certificate1").length;
    $(".hidden-destroy").hide();
    if (fileIndex.length == 0) $(".add-btn").css("display", "none");
    $(".add-btn").on("click", function () {
      $(".sikaku").append(buildField(fileIndex[0]));
      fileIndex.shift();
      if (fileIndex.length == 0) $(".add-btn").css("display", "none");
      displayCount += 1;
    }); //   $(".sikaku").on("click", ".delete-form-btn", function() {
    //     $(".add-btn").css("display","block");
    //     const targetIndex = $(this).parent().parent().data("index")
    //     const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    //     var lastIndex = $(".certificate1:last").data("index");
    //     displayCount -= 1;
    //     if (targetIndex < fileCount) {
    //       $(this).parent().parent().css("display","none")
    //       hiddenCheck.prop("checked", true);
    //     } else {
    //       $(this).parent().parent().remove();
    //     }
    //     if (fileIndex.length >= 1) {
    //       fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    //     } else {
    //       fileIndex.push(lastIndex + 1);
    //     }
    //     if (displayCount == 0) {
    //       $(".sikaku").append(buildField(fileIndex[0] - 1));
    //       fileIndex.shift();
    //       displayCount += 1;
    //     } 
    //   })
  });
  $(function () {
    function buildField(index) {
      var html = "<div class=\"WorkResultBox\" data-index=\"".concat(index, "\"> \n        <table class=\"editable\">\n        <tr>\n            <th width=\"150\">\u7D4C\u6B74\u30FB\u5B9F\u7E3E</th>\n            <td colspan=\"3\">\n                <div class=\"m-t-5\">\n                <textarea name=\"user[career]\" id=\"user_career\"></textarea>\n                </div>\n            </td>\n        </tr>\n        <tr>\n            <th width=\"150\">\u671F\u9593</th>\n            <td colspan=\"3\">\n            <select id=\"user_year_1i\" name=\"user[year(1i)]\">\n                <option value=\"\" label=\" \"></option>\n                <option value=\"2017\">2017</option>\n                <option value=\"2018\">2018</option>\n                <option value=\"2019\">2019</option>\n                <option value=\"2020\">2020</option>\n                <option value=\"2021\">2021</option>\n                <option value=\"2022\">2022</option>\n                <option value=\"2023\">2023</option>\n                <option value=\"2024\">2024</option>\n                <option value=\"2025\">2025</option>\n                <option value=\"2026\">2026</option>\n                <option value=\"2027\">2027</option>\n                </select>\n                <select id=\"user_year_2i\" name=\"user[year(2i)]\">\n                <option value=\"\" label=\" \"></option>\n                <option value=\"1\">1\u6708</option>\n                <option value=\"2\">2\u6708</option>\n                <option value=\"3\">3\u6708</option>\n                <option value=\"4\">4\u6708</option>\n                <option value=\"5\">5\u6708</option>\n                <option value=\"6\">6\u6708</option>\n                <option value=\"7\">7\u6708</option>\n                <option value=\"8\">8\u6708</option>\n                <option value=\"9\">9\u6708</option>\n                <option value=\"10\">10\u6708</option>\n                <option value=\"11\">11\u6708</option>\n                <option value=\"12\">12\u6708</option>\n                </select>\n                <input type=\"hidden\" id=\"user_year_3i\" name=\"user[year(3i)]\" value=\"1\" autocomplete=\"off\">\n            \u301C\n            <select id=\"user_year_1i\" name=\"user[year(1i)]\">\n                <option value=\"\" label=\" \"></option>\n                <option value=\"2017\">2017</option>\n                <option value=\"2018\">2018</option>\n                <option value=\"2019\">2019</option>\n                <option value=\"2020\">2020</option>\n                <option value=\"2021\">2021</option>\n                <option value=\"2022\">2022</option>\n                <option value=\"2023\">2023</option>\n                <option value=\"2024\">2024</option>\n                <option value=\"2025\">2025</option>\n                <option value=\"2026\">2026</option>\n                <option value=\"2027\">2027</option>\n                </select>\n                <select id=\"user_year_2i\" name=\"user[year(2i)]\">\n                <option value=\"\" label=\" \"></option>\n                <option value=\"1\">1\u6708</option>\n                <option value=\"2\">2\u6708</option>\n                <option value=\"3\">3\u6708</option>\n                <option value=\"4\">4\u6708</option>\n                <option value=\"5\">5\u6708</option>\n                <option value=\"6\">6\u6708</option>\n                <option value=\"7\">7\u6708</option>\n                <option value=\"8\">8\u6708</option>\n                <option value=\"9\">9\u6708</option>\n                <option value=\"10\">10\u6708</option>\n                <option value=\"11\">11\u6708</option>\n                <option value=\"12\">12\u6708</option>\n                </select>\n                <input type=\"hidden\" id=\"user_year_3i\" name=\"user[year(3i)]\" value=\"1\" autocomplete=\"off\">\n            </td>\n        </tr>\n        <tr>\n            <td></td>\n            <td colspan=\"3\">\n                <span class=\"delete-form-btn\">\n                <i class=\"fa fa-times red\"></i>\n                \u524A\u9664\u3059\u308B\n                </span>\n            </td>\n        </tr>\n    </table>\n        </div>");
      return html;
    }

    var fileIndex = [1, 2, 3, 4];
    var lastIndex = $(".WorkResultBox:last").data("index");
    fileIndex.splice(0, lastIndex);
    var fileCount = $(".hidden-destroy").length;
    var displayCount = $(".WorkResultBox").length;
    $(".hidden-destroy").hide();
    if (fileIndex.length == 0) $(".add-btn").css("display", "none");
    $(".add-btn2").on("click", function () {
      $(".keirekizisseki").append(buildField(fileIndex[0]));
      fileIndex.shift();
      if (fileIndex.length == 0) $(".add-btn").css("display", "none");
      displayCount += 1;
    }); //   $(".keirekizisseki").on("click", ".delete-form-btn", function() {
    //     $(".add-btn2").css("display","block");
    //     const targetIndex = $(this).parent().parent().data("index")
    //     const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    //     var lastIndex = $(".WorkResultBox:last").data("index");
    //     displayCount -= 1;
    //     if (targetIndex < fileCount) {
    //       $(this).parent().parent().css("display","none")
    //       hiddenCheck.prop("checked", true);
    //     } else {
    //       $(this).parent().parent().remove();
    //     }
    //     if (fileIndex.length >= 1) {
    //       fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    //     } else {
    //       fileIndex.push(lastIndex + 1);
    //     }
    //     if (displayCount == 0) {
    //       $(".keirekizisseki").append(buildField(fileIndex[0] - 1));
    //       fileIndex.shift();
    //       displayCount += 1;
    //     } 
    //   })
  });
});

/***/ })

/******/ });
//# sourceMappingURL=profile-e9659583692615dc5d63.js.map