(function(f){if(typeof exports==="object"&&typeof module!=="undefined"){module.exports=f()}else if(typeof define==="function"&&define.amd){define([],f)}else{var g;if(typeof window!=="undefined"){g=window}else if(typeof global!=="undefined"){g=global}else if(typeof self!=="undefined"){g=self}else{g=this}g.pv_content = f()}})(function(){var define,module,exports;return (function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
// Generated by CoffeeScript 1.12.3
(function() {
  var I, log, m271,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  log = require('../log');

  I = require('./I');

  m271 = (function(superClass) {
    extend(m271, superClass);

    function m271() {
      return m271.__super__.constructor.apply(this, arguments);
    }

    m271.prototype.init = function() {
      this.site = '271';
      this._p = window.flash;
      return log.c('c_m/271: init done. ');
    };

    m271.prototype.get_info = function() {
      var o, pi, vi;
      o = m271.__super__.get_info.call(this);
      vi = this._video_info();
      pi = this._player_info();
      o.title_video = vi.vn;
      o.title_sub = vi.subt;
      o.size = pi.width + "x" + pi.height;
      o.max_time_s = pi.totalDuration / 1e3;
      return o;
    };

    m271.prototype.get_time = function() {
      var pi;
      pi = this._player_info();
      return pi.currentTime / 1e3;
    };

    m271.prototype.set_time = function(time_s) {
      return this._player_seek(time_s);
    };

    m271.prototype.pause = function() {
      return this._player_pause();
    };

    m271.prototype._video_info = function() {
      return JSON.parse(this._p['getQiyiVideoInfo']());
    };

    m271.prototype._player_info = function() {
      return JSON.parse(this._p['getQiyiPlayerInfo']());
    };

    m271.prototype._player_log = function() {
      return this._p['getQiyiPlayerLog']();
    };

    m271.prototype._player_seek = function(time_s) {
      return this._p['seekQiyiVideo'](time_s);
    };

    m271.prototype._player_pause = function() {
      return this._p['pauseQiyiVideo']();
    };

    return m271;

  })(I);

  module.exports = m271;

}).call(this);



},{"../log":7,"./I":2}],2:[function(require,module,exports){
// Generated by CoffeeScript 1.12.3
(function() {
  var I;

  I = (function() {
    function I() {
      this.site = '#unknow';
      return;
    }

    I.prototype.init = function() {};

    I.prototype.get_info = function() {
      return {
        site: this.site,
        url: document.URL,
        title: $('title').text(),
        title_video: '#video_title',
        title_sub: '#sub_title',
        size: '#unknow_size',
        max_time_s: '#unknow_max_time_s'
      };
    };

    I.prototype.set_time = function(time_s) {};

    I.prototype.get_time = function() {
      return -1;
    };

    I.prototype.pause = function() {};

    return I;

  })();

  module.exports = I;

}).call(this);



},{}],3:[function(require,module,exports){
// Generated by CoffeeScript 1.12.3
(function() {
  var I, log, m_vqq,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  log = require('../log');

  I = require('./I');

  m_vqq = (function(superClass) {
    extend(m_vqq, superClass);

    function m_vqq() {
      return m_vqq.__super__.constructor.apply(this, arguments);
    }

    m_vqq.prototype.init = function() {
      this.site = 'vqq';
      return log.c('c_m/vqq: init done. ');
    };

    m_vqq.prototype.get_info = function() {
      var o;
      o = m_vqq.__super__.get_info.call(this);
      return o;
    };

    m_vqq.prototype.get_time = function() {};

    m_vqq.prototype.set_time = function(time_s) {};

    m_vqq.prototype.pause = function() {};

    return m_vqq;

  })(I);

  module.exports = m_vqq;

}).call(this);



},{"../log":7,"./I":2}],4:[function(require,module,exports){
// Generated by CoffeeScript 1.12.3
(function() {
  var I, log, m_youku,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  log = require('../log');

  I = require('./I');

  m_youku = (function(superClass) {
    extend(m_youku, superClass);

    function m_youku() {
      return m_youku.__super__.constructor.apply(this, arguments);
    }

    m_youku.prototype.init = function() {
      this.site = 'youku';
      return log.c('c_m/youku: init done. ');
    };

    m_youku.prototype.get_info = function() {
      var o;
      o = m_youku.__super__.get_info.call(this);
      return o;
    };

    m_youku.prototype.get_time = function() {};

    m_youku.prototype.set_time = function(time_s) {};

    m_youku.prototype.pause = function() {};

    return m_youku;

  })(I);

  module.exports = m_youku;

}).call(this);



},{"../log":7,"./I":2}],5:[function(require,module,exports){
// Generated by CoffeeScript 1.12.3
(function() {
  module.exports = {
    check_init_max_wait_s: 20,
    check_video_play_count_s: 5,
    flush_delta_s: 60,
    flush_reserve_s: 120,
    flush_wait_s: 1,
    auto_flush_reserve_s: 5
  };

}).call(this);



},{}],6:[function(require,module,exports){
// Generated by CoffeeScript 1.12.3
(function() {
  var check_list, check_playing, check_site_support, config, content_init, etc, init_msg, log, m271, m_vqq, m_youku, msg, start_check;

  log = require('./log');

  msg = require('./msg');

  config = require('./config');

  m271 = require('./c_m/271');

  m_vqq = require('./c_m/vqq');

  m_youku = require('./c_m/youku');

  check_list = {
    '271': function() {
      var e;
      try {
        window.flash['getQiyiPlayerInfo']();
        return m271;
      } catch (error) {
        e = error;
        return false;
      }
    },
    'vqq': function() {
      var e, i;
      try {
        i = $('object', $('#tenvideo_player')).attr('id');
        window[i]['getFPInfo']();
        return m_vqq;
      } catch (error) {
        e = error;
        return false;
      }
    },
    'youku': function() {
      var e;
      try {
        window.movie_player['getPlayerState']();
        return m_youku;
      } catch (error) {
        e = error;
        return false;
      }
    }
  };

  etc = {
    m_worker: null
  };

  check_site_support = function() {
    var Worker, i;
    for (i in check_list) {
      log.c("checking " + i + " .. . ");
      Worker = check_list[i]();
      if (Worker !== false) {
        log.c("[ OK ] yes! this is " + i + " ;-) ");
        setTimeout(function() {
          return msg.send(msg.t.found, {
            site: etc.m_worker.site,
            url: document.URL,
            title: $('title').text()
          });
        }, 0);
        etc.m_worker = new Worker();
        etc.m_worker.init();
        check_playing();
        return true;
      }
    }
    return false;
  };

  start_check = function() {
    var _check, check_max_s, count;
    count = {
      i: 0
    };
    check_max_s = config.check_init_max_wait_s;
    _check = function() {
      var result;
      result = check_site_support();
      if (result) {
        return log.c("found supported site (page) after " + count.i + "s");
      } else {
        count.i += 1;
        if (count.i > check_max_s) {
          return log.c("give up, check support after " + count.i + "s");
        } else {
          return setTimeout(_check, 1e3);
        }
      }
    };
    log.c('start check page (site support)');
    return setTimeout(_check, 0);
  };

  check_playing = function() {
    var _check_play, count, count_max, w;
    count = {
      i: 0,
      old: null
    };
    count_max = config.check_video_play_count_s;
    w = etc.m_worker;
    _check_play = function() {
      var now;
      now = w.get_time();
      if (now !== count.old) {
        count.i += 1;
      } else {
        count.i = 0;
      }
      count.old = now;
      if (count.i > count_max) {
        log.c("video is now playing .. . (" + count_max + "s)");
        return msg.send(msg.t.playing, w.get_info());
      } else {
        return setTimeout(_check_play, 1e3);
      }
    };
    log.c('start check video playing .. . ');
    return setTimeout(_check_play, 0);
  };

  init_msg = function() {
    return msg.on(function(info) {
      log.c("DEBUG: got msg, type == " + info.type + ", data == " + (JSON.stringify(info.data)) + " ");
      switch (info.type) {
        case msg.t.check_support:
          log.c('check_support, again');
          return start_check();
        case msg.t.get_info:
          return info.callback(etc.m_worker.get_info());
        case msg.t.set_time:
          return setTimeout(function() {
            var s;
            s = info.data.time_s;
            log.c("set_time, s == " + s + " ");
            etc.m_worker.set_time(s);
            if (info.data.pause) {
              return etc.m_worker.pause();
            }
          }, 0);
        default:
          return log.c("FIXME: unknow msg, type == " + info.type + " ");
      }
    });
  };

  content_init = function() {
    init_msg();
    return start_check();
  };

  content_init();

}).call(this);



},{"./c_m/271":1,"./c_m/vqq":3,"./c_m/youku":4,"./config":5,"./log":7,"./msg":8}],7:[function(require,module,exports){
// Generated by CoffeeScript 1.12.3
(function() {
  var log_p;

  log_p = function(text) {
    return console.log(module.exports.prefix + text);
  };

  module.exports = {
    prefix: 'parse_v-crx: ',
    d: function(text) {
      return log_p('DEBUG: ' + text);
    },
    c: function(text) {
      return log_p('content script: ' + text);
    }
  };

}).call(this);



},{}],8:[function(require,module,exports){
// Generated by CoffeeScript 1.12.3
(function() {
  var msg_type_check_support, msg_type_flush_done, msg_type_found, msg_type_get_all, msg_type_get_info, msg_type_get_one_file, msg_type_get_state, msg_type_playing, msg_type_set_time, msg_type_start_flush, msg_version, parse_v_mark, send_msg, send_to_content, set_on_msg;

  parse_v_mark = 'uuid=ec9680e6-da5e-4971-ac5f-25d971bf6366';

  msg_version = '0.1.0-1';

  msg_type_found = 'content_found';

  msg_type_playing = 'content_playing';

  msg_type_get_info = 'content_get_info';

  msg_type_check_support = 'content_check_support';

  msg_type_set_time = 'content_set_time';

  msg_type_get_state = 'popup_get_state';

  msg_type_start_flush = 'popup_start_flush';

  msg_type_flush_done = 'popup_flush_done';

  msg_type_get_all = 'dl_get_all';

  msg_type_get_one_file = 'dl_get_one_file';

  set_on_msg = function(callback) {
    return chrome.runtime.onMessage.addListener(function(msg, sender, send_res) {
      var e;
      try {
        if (!((msg.mark === parse_v_mark) && (msg.version === msg_version))) {
          return;
        }
      } catch (error) {
        e = error;
        return;
      }
      callback({
        mark: msg.mark,
        version: msg.version,
        type: msg.type,
        data: msg.data,
        sender: sender,
        callback: send_res
      });
      return true;
    });
  };

  send_msg = function(msg_type, data, callback) {
    var msg;
    msg = {
      mark: parse_v_mark,
      version: msg_version,
      type: msg_type,
      data: data
    };
    return chrome.runtime.sendMessage(null, msg, callback);
  };

  send_to_content = function(msg_type, data, callback, tab_id) {
    var msg;
    msg = {
      mark: parse_v_mark,
      version: msg_version,
      type: msg_type,
      data: data
    };
    return chrome.tabs.sendMessage(tab_id, msg, callback);
  };

  module.exports = {
    mark: parse_v_mark,
    version: msg_version,
    t: {
      found: msg_type_found,
      playing: msg_type_playing,
      get_info: msg_type_get_info,
      check_support: msg_type_check_support,
      set_time: msg_type_set_time,
      get_state: msg_type_get_state,
      start_flush: msg_type_start_flush,
      flush_done: msg_type_flush_done,
      get_all: msg_type_get_all,
      get_one_file: msg_type_get_one_file
    },
    on: set_on_msg,
    send: send_msg,
    send_to_content: send_to_content
  };

}).call(this);



},{}]},{},[6])(6)
});
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIm5vZGVfbW9kdWxlcy9icm93c2VyLXBhY2svX3ByZWx1ZGUuanMiLCJkaXN0L3MvY19tLzI3MS5qcyIsImRpc3Qvcy9jX20vSS5qcyIsImRpc3Qvcy9jX20vdnFxLmpzIiwiZGlzdC9zL2NfbS95b3VrdS5qcyIsImRpc3Qvcy9jb25maWcuanMiLCJkaXN0L3MvY29udGVudC5qcyIsImRpc3Qvcy9sb2cuanMiLCJkaXN0L3MvbXNnLmpzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBO0FDQUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FDOUVBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUN6Q0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUMzQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUMzQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQ2RBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUNwS0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FDckJBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBIiwiZmlsZSI6ImdlbmVyYXRlZC5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzQ29udGVudCI6WyIoZnVuY3Rpb24gZSh0LG4scil7ZnVuY3Rpb24gcyhvLHUpe2lmKCFuW29dKXtpZighdFtvXSl7dmFyIGE9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtpZighdSYmYSlyZXR1cm4gYShvLCEwKTtpZihpKXJldHVybiBpKG8sITApO3ZhciBmPW5ldyBFcnJvcihcIkNhbm5vdCBmaW5kIG1vZHVsZSAnXCIrbytcIidcIik7dGhyb3cgZi5jb2RlPVwiTU9EVUxFX05PVF9GT1VORFwiLGZ9dmFyIGw9bltvXT17ZXhwb3J0czp7fX07dFtvXVswXS5jYWxsKGwuZXhwb3J0cyxmdW5jdGlvbihlKXt2YXIgbj10W29dWzFdW2VdO3JldHVybiBzKG4/bjplKX0sbCxsLmV4cG9ydHMsZSx0LG4scil9cmV0dXJuIG5bb10uZXhwb3J0c312YXIgaT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2Zvcih2YXIgbz0wO288ci5sZW5ndGg7bysrKXMocltvXSk7cmV0dXJuIHN9KSIsIi8vIEdlbmVyYXRlZCBieSBDb2ZmZWVTY3JpcHQgMS4xMi4zXG4oZnVuY3Rpb24oKSB7XG4gIHZhciBJLCBsb2csIG0yNzEsXG4gICAgZXh0ZW5kID0gZnVuY3Rpb24oY2hpbGQsIHBhcmVudCkgeyBmb3IgKHZhciBrZXkgaW4gcGFyZW50KSB7IGlmIChoYXNQcm9wLmNhbGwocGFyZW50LCBrZXkpKSBjaGlsZFtrZXldID0gcGFyZW50W2tleV07IH0gZnVuY3Rpb24gY3RvcigpIHsgdGhpcy5jb25zdHJ1Y3RvciA9IGNoaWxkOyB9IGN0b3IucHJvdG90eXBlID0gcGFyZW50LnByb3RvdHlwZTsgY2hpbGQucHJvdG90eXBlID0gbmV3IGN0b3IoKTsgY2hpbGQuX19zdXBlcl9fID0gcGFyZW50LnByb3RvdHlwZTsgcmV0dXJuIGNoaWxkOyB9LFxuICAgIGhhc1Byb3AgPSB7fS5oYXNPd25Qcm9wZXJ0eTtcblxuICBsb2cgPSByZXF1aXJlKCcuLi9sb2cnKTtcblxuICBJID0gcmVxdWlyZSgnLi9JJyk7XG5cbiAgbTI3MSA9IChmdW5jdGlvbihzdXBlckNsYXNzKSB7XG4gICAgZXh0ZW5kKG0yNzEsIHN1cGVyQ2xhc3MpO1xuXG4gICAgZnVuY3Rpb24gbTI3MSgpIHtcbiAgICAgIHJldHVybiBtMjcxLl9fc3VwZXJfXy5jb25zdHJ1Y3Rvci5hcHBseSh0aGlzLCBhcmd1bWVudHMpO1xuICAgIH1cblxuICAgIG0yNzEucHJvdG90eXBlLmluaXQgPSBmdW5jdGlvbigpIHtcbiAgICAgIHRoaXMuc2l0ZSA9ICcyNzEnO1xuICAgICAgdGhpcy5fcCA9IHdpbmRvdy5mbGFzaDtcbiAgICAgIHJldHVybiBsb2cuYygnY19tLzI3MTogaW5pdCBkb25lLiAnKTtcbiAgICB9O1xuXG4gICAgbTI3MS5wcm90b3R5cGUuZ2V0X2luZm8gPSBmdW5jdGlvbigpIHtcbiAgICAgIHZhciBvLCBwaSwgdmk7XG4gICAgICBvID0gbTI3MS5fX3N1cGVyX18uZ2V0X2luZm8uY2FsbCh0aGlzKTtcbiAgICAgIHZpID0gdGhpcy5fdmlkZW9faW5mbygpO1xuICAgICAgcGkgPSB0aGlzLl9wbGF5ZXJfaW5mbygpO1xuICAgICAgby50aXRsZV92aWRlbyA9IHZpLnZuO1xuICAgICAgby50aXRsZV9zdWIgPSB2aS5zdWJ0O1xuICAgICAgby5zaXplID0gcGkud2lkdGggKyBcInhcIiArIHBpLmhlaWdodDtcbiAgICAgIG8ubWF4X3RpbWVfcyA9IHBpLnRvdGFsRHVyYXRpb24gLyAxZTM7XG4gICAgICByZXR1cm4gbztcbiAgICB9O1xuXG4gICAgbTI3MS5wcm90b3R5cGUuZ2V0X3RpbWUgPSBmdW5jdGlvbigpIHtcbiAgICAgIHZhciBwaTtcbiAgICAgIHBpID0gdGhpcy5fcGxheWVyX2luZm8oKTtcbiAgICAgIHJldHVybiBwaS5jdXJyZW50VGltZSAvIDFlMztcbiAgICB9O1xuXG4gICAgbTI3MS5wcm90b3R5cGUuc2V0X3RpbWUgPSBmdW5jdGlvbih0aW1lX3MpIHtcbiAgICAgIHJldHVybiB0aGlzLl9wbGF5ZXJfc2Vlayh0aW1lX3MpO1xuICAgIH07XG5cbiAgICBtMjcxLnByb3RvdHlwZS5wYXVzZSA9IGZ1bmN0aW9uKCkge1xuICAgICAgcmV0dXJuIHRoaXMuX3BsYXllcl9wYXVzZSgpO1xuICAgIH07XG5cbiAgICBtMjcxLnByb3RvdHlwZS5fdmlkZW9faW5mbyA9IGZ1bmN0aW9uKCkge1xuICAgICAgcmV0dXJuIEpTT04ucGFyc2UodGhpcy5fcFsnZ2V0UWl5aVZpZGVvSW5mbyddKCkpO1xuICAgIH07XG5cbiAgICBtMjcxLnByb3RvdHlwZS5fcGxheWVyX2luZm8gPSBmdW5jdGlvbigpIHtcbiAgICAgIHJldHVybiBKU09OLnBhcnNlKHRoaXMuX3BbJ2dldFFpeWlQbGF5ZXJJbmZvJ10oKSk7XG4gICAgfTtcblxuICAgIG0yNzEucHJvdG90eXBlLl9wbGF5ZXJfbG9nID0gZnVuY3Rpb24oKSB7XG4gICAgICByZXR1cm4gdGhpcy5fcFsnZ2V0UWl5aVBsYXllckxvZyddKCk7XG4gICAgfTtcblxuICAgIG0yNzEucHJvdG90eXBlLl9wbGF5ZXJfc2VlayA9IGZ1bmN0aW9uKHRpbWVfcykge1xuICAgICAgcmV0dXJuIHRoaXMuX3BbJ3NlZWtRaXlpVmlkZW8nXSh0aW1lX3MpO1xuICAgIH07XG5cbiAgICBtMjcxLnByb3RvdHlwZS5fcGxheWVyX3BhdXNlID0gZnVuY3Rpb24oKSB7XG4gICAgICByZXR1cm4gdGhpcy5fcFsncGF1c2VRaXlpVmlkZW8nXSgpO1xuICAgIH07XG5cbiAgICByZXR1cm4gbTI3MTtcblxuICB9KShJKTtcblxuICBtb2R1bGUuZXhwb3J0cyA9IG0yNzE7XG5cbn0pLmNhbGwodGhpcyk7XG5cbi8vIyBzb3VyY2VNYXBwaW5nVVJMPTI3MS5qcy5tYXBcbiIsIi8vIEdlbmVyYXRlZCBieSBDb2ZmZWVTY3JpcHQgMS4xMi4zXG4oZnVuY3Rpb24oKSB7XG4gIHZhciBJO1xuXG4gIEkgPSAoZnVuY3Rpb24oKSB7XG4gICAgZnVuY3Rpb24gSSgpIHtcbiAgICAgIHRoaXMuc2l0ZSA9ICcjdW5rbm93JztcbiAgICAgIHJldHVybjtcbiAgICB9XG5cbiAgICBJLnByb3RvdHlwZS5pbml0ID0gZnVuY3Rpb24oKSB7fTtcblxuICAgIEkucHJvdG90eXBlLmdldF9pbmZvID0gZnVuY3Rpb24oKSB7XG4gICAgICByZXR1cm4ge1xuICAgICAgICBzaXRlOiB0aGlzLnNpdGUsXG4gICAgICAgIHVybDogZG9jdW1lbnQuVVJMLFxuICAgICAgICB0aXRsZTogJCgndGl0bGUnKS50ZXh0KCksXG4gICAgICAgIHRpdGxlX3ZpZGVvOiAnI3ZpZGVvX3RpdGxlJyxcbiAgICAgICAgdGl0bGVfc3ViOiAnI3N1Yl90aXRsZScsXG4gICAgICAgIHNpemU6ICcjdW5rbm93X3NpemUnLFxuICAgICAgICBtYXhfdGltZV9zOiAnI3Vua25vd19tYXhfdGltZV9zJ1xuICAgICAgfTtcbiAgICB9O1xuXG4gICAgSS5wcm90b3R5cGUuc2V0X3RpbWUgPSBmdW5jdGlvbih0aW1lX3MpIHt9O1xuXG4gICAgSS5wcm90b3R5cGUuZ2V0X3RpbWUgPSBmdW5jdGlvbigpIHtcbiAgICAgIHJldHVybiAtMTtcbiAgICB9O1xuXG4gICAgSS5wcm90b3R5cGUucGF1c2UgPSBmdW5jdGlvbigpIHt9O1xuXG4gICAgcmV0dXJuIEk7XG5cbiAgfSkoKTtcblxuICBtb2R1bGUuZXhwb3J0cyA9IEk7XG5cbn0pLmNhbGwodGhpcyk7XG5cbi8vIyBzb3VyY2VNYXBwaW5nVVJMPUkuanMubWFwXG4iLCIvLyBHZW5lcmF0ZWQgYnkgQ29mZmVlU2NyaXB0IDEuMTIuM1xuKGZ1bmN0aW9uKCkge1xuICB2YXIgSSwgbG9nLCBtX3ZxcSxcbiAgICBleHRlbmQgPSBmdW5jdGlvbihjaGlsZCwgcGFyZW50KSB7IGZvciAodmFyIGtleSBpbiBwYXJlbnQpIHsgaWYgKGhhc1Byb3AuY2FsbChwYXJlbnQsIGtleSkpIGNoaWxkW2tleV0gPSBwYXJlbnRba2V5XTsgfSBmdW5jdGlvbiBjdG9yKCkgeyB0aGlzLmNvbnN0cnVjdG9yID0gY2hpbGQ7IH0gY3Rvci5wcm90b3R5cGUgPSBwYXJlbnQucHJvdG90eXBlOyBjaGlsZC5wcm90b3R5cGUgPSBuZXcgY3RvcigpOyBjaGlsZC5fX3N1cGVyX18gPSBwYXJlbnQucHJvdG90eXBlOyByZXR1cm4gY2hpbGQ7IH0sXG4gICAgaGFzUHJvcCA9IHt9Lmhhc093blByb3BlcnR5O1xuXG4gIGxvZyA9IHJlcXVpcmUoJy4uL2xvZycpO1xuXG4gIEkgPSByZXF1aXJlKCcuL0knKTtcblxuICBtX3ZxcSA9IChmdW5jdGlvbihzdXBlckNsYXNzKSB7XG4gICAgZXh0ZW5kKG1fdnFxLCBzdXBlckNsYXNzKTtcblxuICAgIGZ1bmN0aW9uIG1fdnFxKCkge1xuICAgICAgcmV0dXJuIG1fdnFxLl9fc3VwZXJfXy5jb25zdHJ1Y3Rvci5hcHBseSh0aGlzLCBhcmd1bWVudHMpO1xuICAgIH1cblxuICAgIG1fdnFxLnByb3RvdHlwZS5pbml0ID0gZnVuY3Rpb24oKSB7XG4gICAgICB0aGlzLnNpdGUgPSAndnFxJztcbiAgICAgIHJldHVybiBsb2cuYygnY19tL3ZxcTogaW5pdCBkb25lLiAnKTtcbiAgICB9O1xuXG4gICAgbV92cXEucHJvdG90eXBlLmdldF9pbmZvID0gZnVuY3Rpb24oKSB7XG4gICAgICB2YXIgbztcbiAgICAgIG8gPSBtX3ZxcS5fX3N1cGVyX18uZ2V0X2luZm8uY2FsbCh0aGlzKTtcbiAgICAgIHJldHVybiBvO1xuICAgIH07XG5cbiAgICBtX3ZxcS5wcm90b3R5cGUuZ2V0X3RpbWUgPSBmdW5jdGlvbigpIHt9O1xuXG4gICAgbV92cXEucHJvdG90eXBlLnNldF90aW1lID0gZnVuY3Rpb24odGltZV9zKSB7fTtcblxuICAgIG1fdnFxLnByb3RvdHlwZS5wYXVzZSA9IGZ1bmN0aW9uKCkge307XG5cbiAgICByZXR1cm4gbV92cXE7XG5cbiAgfSkoSSk7XG5cbiAgbW9kdWxlLmV4cG9ydHMgPSBtX3ZxcTtcblxufSkuY2FsbCh0aGlzKTtcblxuLy8jIHNvdXJjZU1hcHBpbmdVUkw9dnFxLmpzLm1hcFxuIiwiLy8gR2VuZXJhdGVkIGJ5IENvZmZlZVNjcmlwdCAxLjEyLjNcbihmdW5jdGlvbigpIHtcbiAgdmFyIEksIGxvZywgbV95b3VrdSxcbiAgICBleHRlbmQgPSBmdW5jdGlvbihjaGlsZCwgcGFyZW50KSB7IGZvciAodmFyIGtleSBpbiBwYXJlbnQpIHsgaWYgKGhhc1Byb3AuY2FsbChwYXJlbnQsIGtleSkpIGNoaWxkW2tleV0gPSBwYXJlbnRba2V5XTsgfSBmdW5jdGlvbiBjdG9yKCkgeyB0aGlzLmNvbnN0cnVjdG9yID0gY2hpbGQ7IH0gY3Rvci5wcm90b3R5cGUgPSBwYXJlbnQucHJvdG90eXBlOyBjaGlsZC5wcm90b3R5cGUgPSBuZXcgY3RvcigpOyBjaGlsZC5fX3N1cGVyX18gPSBwYXJlbnQucHJvdG90eXBlOyByZXR1cm4gY2hpbGQ7IH0sXG4gICAgaGFzUHJvcCA9IHt9Lmhhc093blByb3BlcnR5O1xuXG4gIGxvZyA9IHJlcXVpcmUoJy4uL2xvZycpO1xuXG4gIEkgPSByZXF1aXJlKCcuL0knKTtcblxuICBtX3lvdWt1ID0gKGZ1bmN0aW9uKHN1cGVyQ2xhc3MpIHtcbiAgICBleHRlbmQobV95b3VrdSwgc3VwZXJDbGFzcyk7XG5cbiAgICBmdW5jdGlvbiBtX3lvdWt1KCkge1xuICAgICAgcmV0dXJuIG1feW91a3UuX19zdXBlcl9fLmNvbnN0cnVjdG9yLmFwcGx5KHRoaXMsIGFyZ3VtZW50cyk7XG4gICAgfVxuXG4gICAgbV95b3VrdS5wcm90b3R5cGUuaW5pdCA9IGZ1bmN0aW9uKCkge1xuICAgICAgdGhpcy5zaXRlID0gJ3lvdWt1JztcbiAgICAgIHJldHVybiBsb2cuYygnY19tL3lvdWt1OiBpbml0IGRvbmUuICcpO1xuICAgIH07XG5cbiAgICBtX3lvdWt1LnByb3RvdHlwZS5nZXRfaW5mbyA9IGZ1bmN0aW9uKCkge1xuICAgICAgdmFyIG87XG4gICAgICBvID0gbV95b3VrdS5fX3N1cGVyX18uZ2V0X2luZm8uY2FsbCh0aGlzKTtcbiAgICAgIHJldHVybiBvO1xuICAgIH07XG5cbiAgICBtX3lvdWt1LnByb3RvdHlwZS5nZXRfdGltZSA9IGZ1bmN0aW9uKCkge307XG5cbiAgICBtX3lvdWt1LnByb3RvdHlwZS5zZXRfdGltZSA9IGZ1bmN0aW9uKHRpbWVfcykge307XG5cbiAgICBtX3lvdWt1LnByb3RvdHlwZS5wYXVzZSA9IGZ1bmN0aW9uKCkge307XG5cbiAgICByZXR1cm4gbV95b3VrdTtcblxuICB9KShJKTtcblxuICBtb2R1bGUuZXhwb3J0cyA9IG1feW91a3U7XG5cbn0pLmNhbGwodGhpcyk7XG5cbi8vIyBzb3VyY2VNYXBwaW5nVVJMPXlvdWt1LmpzLm1hcFxuIiwiLy8gR2VuZXJhdGVkIGJ5IENvZmZlZVNjcmlwdCAxLjEyLjNcbihmdW5jdGlvbigpIHtcbiAgbW9kdWxlLmV4cG9ydHMgPSB7XG4gICAgY2hlY2tfaW5pdF9tYXhfd2FpdF9zOiAyMCxcbiAgICBjaGVja192aWRlb19wbGF5X2NvdW50X3M6IDUsXG4gICAgZmx1c2hfZGVsdGFfczogNjAsXG4gICAgZmx1c2hfcmVzZXJ2ZV9zOiAxMjAsXG4gICAgZmx1c2hfd2FpdF9zOiAxLFxuICAgIGF1dG9fZmx1c2hfcmVzZXJ2ZV9zOiA1XG4gIH07XG5cbn0pLmNhbGwodGhpcyk7XG5cbi8vIyBzb3VyY2VNYXBwaW5nVVJMPWNvbmZpZy5qcy5tYXBcbiIsIi8vIEdlbmVyYXRlZCBieSBDb2ZmZWVTY3JpcHQgMS4xMi4zXG4oZnVuY3Rpb24oKSB7XG4gIHZhciBjaGVja19saXN0LCBjaGVja19wbGF5aW5nLCBjaGVja19zaXRlX3N1cHBvcnQsIGNvbmZpZywgY29udGVudF9pbml0LCBldGMsIGluaXRfbXNnLCBsb2csIG0yNzEsIG1fdnFxLCBtX3lvdWt1LCBtc2csIHN0YXJ0X2NoZWNrO1xuXG4gIGxvZyA9IHJlcXVpcmUoJy4vbG9nJyk7XG5cbiAgbXNnID0gcmVxdWlyZSgnLi9tc2cnKTtcblxuICBjb25maWcgPSByZXF1aXJlKCcuL2NvbmZpZycpO1xuXG4gIG0yNzEgPSByZXF1aXJlKCcuL2NfbS8yNzEnKTtcblxuICBtX3ZxcSA9IHJlcXVpcmUoJy4vY19tL3ZxcScpO1xuXG4gIG1feW91a3UgPSByZXF1aXJlKCcuL2NfbS95b3VrdScpO1xuXG4gIGNoZWNrX2xpc3QgPSB7XG4gICAgJzI3MSc6IGZ1bmN0aW9uKCkge1xuICAgICAgdmFyIGU7XG4gICAgICB0cnkge1xuICAgICAgICB3aW5kb3cuZmxhc2hbJ2dldFFpeWlQbGF5ZXJJbmZvJ10oKTtcbiAgICAgICAgcmV0dXJuIG0yNzE7XG4gICAgICB9IGNhdGNoIChlcnJvcikge1xuICAgICAgICBlID0gZXJyb3I7XG4gICAgICAgIHJldHVybiBmYWxzZTtcbiAgICAgIH1cbiAgICB9LFxuICAgICd2cXEnOiBmdW5jdGlvbigpIHtcbiAgICAgIHZhciBlLCBpO1xuICAgICAgdHJ5IHtcbiAgICAgICAgaSA9ICQoJ29iamVjdCcsICQoJyN0ZW52aWRlb19wbGF5ZXInKSkuYXR0cignaWQnKTtcbiAgICAgICAgd2luZG93W2ldWydnZXRGUEluZm8nXSgpO1xuICAgICAgICByZXR1cm4gbV92cXE7XG4gICAgICB9IGNhdGNoIChlcnJvcikge1xuICAgICAgICBlID0gZXJyb3I7XG4gICAgICAgIHJldHVybiBmYWxzZTtcbiAgICAgIH1cbiAgICB9LFxuICAgICd5b3VrdSc6IGZ1bmN0aW9uKCkge1xuICAgICAgdmFyIGU7XG4gICAgICB0cnkge1xuICAgICAgICB3aW5kb3cubW92aWVfcGxheWVyWydnZXRQbGF5ZXJTdGF0ZSddKCk7XG4gICAgICAgIHJldHVybiBtX3lvdWt1O1xuICAgICAgfSBjYXRjaCAoZXJyb3IpIHtcbiAgICAgICAgZSA9IGVycm9yO1xuICAgICAgICByZXR1cm4gZmFsc2U7XG4gICAgICB9XG4gICAgfVxuICB9O1xuXG4gIGV0YyA9IHtcbiAgICBtX3dvcmtlcjogbnVsbFxuICB9O1xuXG4gIGNoZWNrX3NpdGVfc3VwcG9ydCA9IGZ1bmN0aW9uKCkge1xuICAgIHZhciBXb3JrZXIsIGk7XG4gICAgZm9yIChpIGluIGNoZWNrX2xpc3QpIHtcbiAgICAgIGxvZy5jKFwiY2hlY2tpbmcgXCIgKyBpICsgXCIgLi4gLiBcIik7XG4gICAgICBXb3JrZXIgPSBjaGVja19saXN0W2ldKCk7XG4gICAgICBpZiAoV29ya2VyICE9PSBmYWxzZSkge1xuICAgICAgICBsb2cuYyhcIlsgT0sgXSB5ZXMhIHRoaXMgaXMgXCIgKyBpICsgXCIgOy0pIFwiKTtcbiAgICAgICAgc2V0VGltZW91dChmdW5jdGlvbigpIHtcbiAgICAgICAgICByZXR1cm4gbXNnLnNlbmQobXNnLnQuZm91bmQsIHtcbiAgICAgICAgICAgIHNpdGU6IGV0Yy5tX3dvcmtlci5zaXRlLFxuICAgICAgICAgICAgdXJsOiBkb2N1bWVudC5VUkwsXG4gICAgICAgICAgICB0aXRsZTogJCgndGl0bGUnKS50ZXh0KClcbiAgICAgICAgICB9KTtcbiAgICAgICAgfSwgMCk7XG4gICAgICAgIGV0Yy5tX3dvcmtlciA9IG5ldyBXb3JrZXIoKTtcbiAgICAgICAgZXRjLm1fd29ya2VyLmluaXQoKTtcbiAgICAgICAgY2hlY2tfcGxheWluZygpO1xuICAgICAgICByZXR1cm4gdHJ1ZTtcbiAgICAgIH1cbiAgICB9XG4gICAgcmV0dXJuIGZhbHNlO1xuICB9O1xuXG4gIHN0YXJ0X2NoZWNrID0gZnVuY3Rpb24oKSB7XG4gICAgdmFyIF9jaGVjaywgY2hlY2tfbWF4X3MsIGNvdW50O1xuICAgIGNvdW50ID0ge1xuICAgICAgaTogMFxuICAgIH07XG4gICAgY2hlY2tfbWF4X3MgPSBjb25maWcuY2hlY2tfaW5pdF9tYXhfd2FpdF9zO1xuICAgIF9jaGVjayA9IGZ1bmN0aW9uKCkge1xuICAgICAgdmFyIHJlc3VsdDtcbiAgICAgIHJlc3VsdCA9IGNoZWNrX3NpdGVfc3VwcG9ydCgpO1xuICAgICAgaWYgKHJlc3VsdCkge1xuICAgICAgICByZXR1cm4gbG9nLmMoXCJmb3VuZCBzdXBwb3J0ZWQgc2l0ZSAocGFnZSkgYWZ0ZXIgXCIgKyBjb3VudC5pICsgXCJzXCIpO1xuICAgICAgfSBlbHNlIHtcbiAgICAgICAgY291bnQuaSArPSAxO1xuICAgICAgICBpZiAoY291bnQuaSA+IGNoZWNrX21heF9zKSB7XG4gICAgICAgICAgcmV0dXJuIGxvZy5jKFwiZ2l2ZSB1cCwgY2hlY2sgc3VwcG9ydCBhZnRlciBcIiArIGNvdW50LmkgKyBcInNcIik7XG4gICAgICAgIH0gZWxzZSB7XG4gICAgICAgICAgcmV0dXJuIHNldFRpbWVvdXQoX2NoZWNrLCAxZTMpO1xuICAgICAgICB9XG4gICAgICB9XG4gICAgfTtcbiAgICBsb2cuYygnc3RhcnQgY2hlY2sgcGFnZSAoc2l0ZSBzdXBwb3J0KScpO1xuICAgIHJldHVybiBzZXRUaW1lb3V0KF9jaGVjaywgMCk7XG4gIH07XG5cbiAgY2hlY2tfcGxheWluZyA9IGZ1bmN0aW9uKCkge1xuICAgIHZhciBfY2hlY2tfcGxheSwgY291bnQsIGNvdW50X21heCwgdztcbiAgICBjb3VudCA9IHtcbiAgICAgIGk6IDAsXG4gICAgICBvbGQ6IG51bGxcbiAgICB9O1xuICAgIGNvdW50X21heCA9IGNvbmZpZy5jaGVja192aWRlb19wbGF5X2NvdW50X3M7XG4gICAgdyA9IGV0Yy5tX3dvcmtlcjtcbiAgICBfY2hlY2tfcGxheSA9IGZ1bmN0aW9uKCkge1xuICAgICAgdmFyIG5vdztcbiAgICAgIG5vdyA9IHcuZ2V0X3RpbWUoKTtcbiAgICAgIGlmIChub3cgIT09IGNvdW50Lm9sZCkge1xuICAgICAgICBjb3VudC5pICs9IDE7XG4gICAgICB9IGVsc2Uge1xuICAgICAgICBjb3VudC5pID0gMDtcbiAgICAgIH1cbiAgICAgIGNvdW50Lm9sZCA9IG5vdztcbiAgICAgIGlmIChjb3VudC5pID4gY291bnRfbWF4KSB7XG4gICAgICAgIGxvZy5jKFwidmlkZW8gaXMgbm93IHBsYXlpbmcgLi4gLiAoXCIgKyBjb3VudF9tYXggKyBcInMpXCIpO1xuICAgICAgICByZXR1cm4gbXNnLnNlbmQobXNnLnQucGxheWluZywgdy5nZXRfaW5mbygpKTtcbiAgICAgIH0gZWxzZSB7XG4gICAgICAgIHJldHVybiBzZXRUaW1lb3V0KF9jaGVja19wbGF5LCAxZTMpO1xuICAgICAgfVxuICAgIH07XG4gICAgbG9nLmMoJ3N0YXJ0IGNoZWNrIHZpZGVvIHBsYXlpbmcgLi4gLiAnKTtcbiAgICByZXR1cm4gc2V0VGltZW91dChfY2hlY2tfcGxheSwgMCk7XG4gIH07XG5cbiAgaW5pdF9tc2cgPSBmdW5jdGlvbigpIHtcbiAgICByZXR1cm4gbXNnLm9uKGZ1bmN0aW9uKGluZm8pIHtcbiAgICAgIGxvZy5jKFwiREVCVUc6IGdvdCBtc2csIHR5cGUgPT0gXCIgKyBpbmZvLnR5cGUgKyBcIiwgZGF0YSA9PSBcIiArIChKU09OLnN0cmluZ2lmeShpbmZvLmRhdGEpKSArIFwiIFwiKTtcbiAgICAgIHN3aXRjaCAoaW5mby50eXBlKSB7XG4gICAgICAgIGNhc2UgbXNnLnQuY2hlY2tfc3VwcG9ydDpcbiAgICAgICAgICBsb2cuYygnY2hlY2tfc3VwcG9ydCwgYWdhaW4nKTtcbiAgICAgICAgICByZXR1cm4gc3RhcnRfY2hlY2soKTtcbiAgICAgICAgY2FzZSBtc2cudC5nZXRfaW5mbzpcbiAgICAgICAgICByZXR1cm4gaW5mby5jYWxsYmFjayhldGMubV93b3JrZXIuZ2V0X2luZm8oKSk7XG4gICAgICAgIGNhc2UgbXNnLnQuc2V0X3RpbWU6XG4gICAgICAgICAgcmV0dXJuIHNldFRpbWVvdXQoZnVuY3Rpb24oKSB7XG4gICAgICAgICAgICB2YXIgcztcbiAgICAgICAgICAgIHMgPSBpbmZvLmRhdGEudGltZV9zO1xuICAgICAgICAgICAgbG9nLmMoXCJzZXRfdGltZSwgcyA9PSBcIiArIHMgKyBcIiBcIik7XG4gICAgICAgICAgICBldGMubV93b3JrZXIuc2V0X3RpbWUocyk7XG4gICAgICAgICAgICBpZiAoaW5mby5kYXRhLnBhdXNlKSB7XG4gICAgICAgICAgICAgIHJldHVybiBldGMubV93b3JrZXIucGF1c2UoKTtcbiAgICAgICAgICAgIH1cbiAgICAgICAgICB9LCAwKTtcbiAgICAgICAgZGVmYXVsdDpcbiAgICAgICAgICByZXR1cm4gbG9nLmMoXCJGSVhNRTogdW5rbm93IG1zZywgdHlwZSA9PSBcIiArIGluZm8udHlwZSArIFwiIFwiKTtcbiAgICAgIH1cbiAgICB9KTtcbiAgfTtcblxuICBjb250ZW50X2luaXQgPSBmdW5jdGlvbigpIHtcbiAgICBpbml0X21zZygpO1xuICAgIHJldHVybiBzdGFydF9jaGVjaygpO1xuICB9O1xuXG4gIGNvbnRlbnRfaW5pdCgpO1xuXG59KS5jYWxsKHRoaXMpO1xuXG4vLyMgc291cmNlTWFwcGluZ1VSTD1jb250ZW50LmpzLm1hcFxuIiwiLy8gR2VuZXJhdGVkIGJ5IENvZmZlZVNjcmlwdCAxLjEyLjNcbihmdW5jdGlvbigpIHtcbiAgdmFyIGxvZ19wO1xuXG4gIGxvZ19wID0gZnVuY3Rpb24odGV4dCkge1xuICAgIHJldHVybiBjb25zb2xlLmxvZyhtb2R1bGUuZXhwb3J0cy5wcmVmaXggKyB0ZXh0KTtcbiAgfTtcblxuICBtb2R1bGUuZXhwb3J0cyA9IHtcbiAgICBwcmVmaXg6ICdwYXJzZV92LWNyeDogJyxcbiAgICBkOiBmdW5jdGlvbih0ZXh0KSB7XG4gICAgICByZXR1cm4gbG9nX3AoJ0RFQlVHOiAnICsgdGV4dCk7XG4gICAgfSxcbiAgICBjOiBmdW5jdGlvbih0ZXh0KSB7XG4gICAgICByZXR1cm4gbG9nX3AoJ2NvbnRlbnQgc2NyaXB0OiAnICsgdGV4dCk7XG4gICAgfVxuICB9O1xuXG59KS5jYWxsKHRoaXMpO1xuXG4vLyMgc291cmNlTWFwcGluZ1VSTD1sb2cuanMubWFwXG4iLCIvLyBHZW5lcmF0ZWQgYnkgQ29mZmVlU2NyaXB0IDEuMTIuM1xuKGZ1bmN0aW9uKCkge1xuICB2YXIgbXNnX3R5cGVfY2hlY2tfc3VwcG9ydCwgbXNnX3R5cGVfZmx1c2hfZG9uZSwgbXNnX3R5cGVfZm91bmQsIG1zZ190eXBlX2dldF9hbGwsIG1zZ190eXBlX2dldF9pbmZvLCBtc2dfdHlwZV9nZXRfb25lX2ZpbGUsIG1zZ190eXBlX2dldF9zdGF0ZSwgbXNnX3R5cGVfcGxheWluZywgbXNnX3R5cGVfc2V0X3RpbWUsIG1zZ190eXBlX3N0YXJ0X2ZsdXNoLCBtc2dfdmVyc2lvbiwgcGFyc2Vfdl9tYXJrLCBzZW5kX21zZywgc2VuZF90b19jb250ZW50LCBzZXRfb25fbXNnO1xuXG4gIHBhcnNlX3ZfbWFyayA9ICd1dWlkPWVjOTY4MGU2LWRhNWUtNDk3MS1hYzVmLTI1ZDk3MWJmNjM2Nic7XG5cbiAgbXNnX3ZlcnNpb24gPSAnMC4xLjAtMSc7XG5cbiAgbXNnX3R5cGVfZm91bmQgPSAnY29udGVudF9mb3VuZCc7XG5cbiAgbXNnX3R5cGVfcGxheWluZyA9ICdjb250ZW50X3BsYXlpbmcnO1xuXG4gIG1zZ190eXBlX2dldF9pbmZvID0gJ2NvbnRlbnRfZ2V0X2luZm8nO1xuXG4gIG1zZ190eXBlX2NoZWNrX3N1cHBvcnQgPSAnY29udGVudF9jaGVja19zdXBwb3J0JztcblxuICBtc2dfdHlwZV9zZXRfdGltZSA9ICdjb250ZW50X3NldF90aW1lJztcblxuICBtc2dfdHlwZV9nZXRfc3RhdGUgPSAncG9wdXBfZ2V0X3N0YXRlJztcblxuICBtc2dfdHlwZV9zdGFydF9mbHVzaCA9ICdwb3B1cF9zdGFydF9mbHVzaCc7XG5cbiAgbXNnX3R5cGVfZmx1c2hfZG9uZSA9ICdwb3B1cF9mbHVzaF9kb25lJztcblxuICBtc2dfdHlwZV9nZXRfYWxsID0gJ2RsX2dldF9hbGwnO1xuXG4gIG1zZ190eXBlX2dldF9vbmVfZmlsZSA9ICdkbF9nZXRfb25lX2ZpbGUnO1xuXG4gIHNldF9vbl9tc2cgPSBmdW5jdGlvbihjYWxsYmFjaykge1xuICAgIHJldHVybiBjaHJvbWUucnVudGltZS5vbk1lc3NhZ2UuYWRkTGlzdGVuZXIoZnVuY3Rpb24obXNnLCBzZW5kZXIsIHNlbmRfcmVzKSB7XG4gICAgICB2YXIgZTtcbiAgICAgIHRyeSB7XG4gICAgICAgIGlmICghKChtc2cubWFyayA9PT0gcGFyc2Vfdl9tYXJrKSAmJiAobXNnLnZlcnNpb24gPT09IG1zZ192ZXJzaW9uKSkpIHtcbiAgICAgICAgICByZXR1cm47XG4gICAgICAgIH1cbiAgICAgIH0gY2F0Y2ggKGVycm9yKSB7XG4gICAgICAgIGUgPSBlcnJvcjtcbiAgICAgICAgcmV0dXJuO1xuICAgICAgfVxuICAgICAgY2FsbGJhY2soe1xuICAgICAgICBtYXJrOiBtc2cubWFyayxcbiAgICAgICAgdmVyc2lvbjogbXNnLnZlcnNpb24sXG4gICAgICAgIHR5cGU6IG1zZy50eXBlLFxuICAgICAgICBkYXRhOiBtc2cuZGF0YSxcbiAgICAgICAgc2VuZGVyOiBzZW5kZXIsXG4gICAgICAgIGNhbGxiYWNrOiBzZW5kX3Jlc1xuICAgICAgfSk7XG4gICAgICByZXR1cm4gdHJ1ZTtcbiAgICB9KTtcbiAgfTtcblxuICBzZW5kX21zZyA9IGZ1bmN0aW9uKG1zZ190eXBlLCBkYXRhLCBjYWxsYmFjaykge1xuICAgIHZhciBtc2c7XG4gICAgbXNnID0ge1xuICAgICAgbWFyazogcGFyc2Vfdl9tYXJrLFxuICAgICAgdmVyc2lvbjogbXNnX3ZlcnNpb24sXG4gICAgICB0eXBlOiBtc2dfdHlwZSxcbiAgICAgIGRhdGE6IGRhdGFcbiAgICB9O1xuICAgIHJldHVybiBjaHJvbWUucnVudGltZS5zZW5kTWVzc2FnZShudWxsLCBtc2csIGNhbGxiYWNrKTtcbiAgfTtcblxuICBzZW5kX3RvX2NvbnRlbnQgPSBmdW5jdGlvbihtc2dfdHlwZSwgZGF0YSwgY2FsbGJhY2ssIHRhYl9pZCkge1xuICAgIHZhciBtc2c7XG4gICAgbXNnID0ge1xuICAgICAgbWFyazogcGFyc2Vfdl9tYXJrLFxuICAgICAgdmVyc2lvbjogbXNnX3ZlcnNpb24sXG4gICAgICB0eXBlOiBtc2dfdHlwZSxcbiAgICAgIGRhdGE6IGRhdGFcbiAgICB9O1xuICAgIHJldHVybiBjaHJvbWUudGFicy5zZW5kTWVzc2FnZSh0YWJfaWQsIG1zZywgY2FsbGJhY2spO1xuICB9O1xuXG4gIG1vZHVsZS5leHBvcnRzID0ge1xuICAgIG1hcms6IHBhcnNlX3ZfbWFyayxcbiAgICB2ZXJzaW9uOiBtc2dfdmVyc2lvbixcbiAgICB0OiB7XG4gICAgICBmb3VuZDogbXNnX3R5cGVfZm91bmQsXG4gICAgICBwbGF5aW5nOiBtc2dfdHlwZV9wbGF5aW5nLFxuICAgICAgZ2V0X2luZm86IG1zZ190eXBlX2dldF9pbmZvLFxuICAgICAgY2hlY2tfc3VwcG9ydDogbXNnX3R5cGVfY2hlY2tfc3VwcG9ydCxcbiAgICAgIHNldF90aW1lOiBtc2dfdHlwZV9zZXRfdGltZSxcbiAgICAgIGdldF9zdGF0ZTogbXNnX3R5cGVfZ2V0X3N0YXRlLFxuICAgICAgc3RhcnRfZmx1c2g6IG1zZ190eXBlX3N0YXJ0X2ZsdXNoLFxuICAgICAgZmx1c2hfZG9uZTogbXNnX3R5cGVfZmx1c2hfZG9uZSxcbiAgICAgIGdldF9hbGw6IG1zZ190eXBlX2dldF9hbGwsXG4gICAgICBnZXRfb25lX2ZpbGU6IG1zZ190eXBlX2dldF9vbmVfZmlsZVxuICAgIH0sXG4gICAgb246IHNldF9vbl9tc2csXG4gICAgc2VuZDogc2VuZF9tc2csXG4gICAgc2VuZF90b19jb250ZW50OiBzZW5kX3RvX2NvbnRlbnRcbiAgfTtcblxufSkuY2FsbCh0aGlzKTtcblxuLy8jIHNvdXJjZU1hcHBpbmdVUkw9bXNnLmpzLm1hcFxuIl19
