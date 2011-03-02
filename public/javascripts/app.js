var Application = function(project_id) {

  if (!!project_id) {
    return;
  }

  var context = this;
  this.project_id = project_id;
  this.host = "http://localhost:3000";
  this.game_create = this.host + "/game/create/";
  this.high_scores_create = this.host + "/scores/create/";

  this.createSession: function() {
    sendRequest(this.game_create, function(game_id) {
      context.game_id = game_id;
    }, "{\"api_key\":\"" + this.project_id + "\"}");
  };

  this.sendHighScores: function(scores) {
    sendRequest(this.high_scores_create, function(result) {
    }, "{\"key\": \"" + MD5.ConvertToWordArray(this.project_id + this.game_id + this.scores) + "\"}");
  };

  function sendRequest(url,callback,postData) {
	  var req = createXMLHTTPObject();
	  if (!req) return;
	  var method = (postData) ? "POST" : "GET";
	  req.open(method,url,true);
	  req.setRequestHeader('User-Agent','XMLHTTP/1.0');
	  if (postData)
		  req.setRequestHeader('Content-type','application/x-www-form-urlencoded');
	    req.onreadystatechange = function () {
		  if (req.readyState != 4) return;
		  if (req.status != 200 && req.status != 304) {
			  return;
		  }
		  callback(req);
	  }
	  if (req.readyState == 4) return;
	  req.send(postData);
  };

  var XMLHttpFactories = [
	  function () {return new XMLHttpRequest()},
	  function () {return new ActiveXObject("Msxml2.XMLHTTP")},
	  function () {return new ActiveXObject("Msxml3.XMLHTTP")},
	  function () {return new ActiveXObject("Microsoft.XMLHTTP")}
  ];

  function createXMLHTTPObject() {
	  var xmlhttp = false;
	  for (var i=0;i<XMLHttpFactories.length;i++) {
		  try {
			  xmlhttp = XMLHttpFactories[i]();
		  } catch (e) {
			  continue;
		  }
		  break;
	  }
	  return xmlhttp;
  };
};

