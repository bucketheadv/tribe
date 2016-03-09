!function(e,t){"function"==typeof define&&define.amd?define("simple-uploader",["jquery","simple-module"],function(r,n){return e.uploader=t(r,n)}):"object"==typeof exports?module.exports=t(require("jquery"),require("simplemodule")):(e.simple=e.simple||{},e.simple.uploader=t(jQuery,SimpleModule))}(this,function(e,t){var r,n,o=function(e,t){function r(){this.constructor=e}for(var n in t)i.call(t,n)&&(e[n]=t[n]);return r.prototype=t.prototype,e.prototype=new r,e.__super__=t.prototype,e},i={}.hasOwnProperty;return r=function(t){function r(){return r.__super__.constructor.apply(this,arguments)}return o(r,t),r.count=0,r.prototype.opts={url:"",params:null,fileKey:"upload_file",connectionCount:3},r.prototype._init=function(){return this.files=[],this.queue=[],this.id=++r.count,this.on("uploadcomplete",function(t){return function(r,n){return t.files.splice(e.inArray(n,t.files),1),t.queue.length>0&&t.files.length<t.opts.connectionCount?t.upload(t.queue.shift()):t.uploading=!1}}(this)),e(window).on("beforeunload.uploader-"+this.id,function(e){return function(t){return e.uploading?(t.originalEvent.returnValue=e._t("leaveConfirm"),e._t("leaveConfirm")):void 0}}(this))},r.prototype.generateId=function(){var e;return e=0,function(){return e+=1}}(),r.prototype.upload=function(t,r){var n,o,i,u;if(null==r&&(r={}),null!=t){if(e.isArray(t)||t instanceof FileList)for(o=0,u=t.length;u>o;o++)n=t[o],this.upload(n,r);else e(t).is("input:file")?(i=e(t).attr("name"),i&&(r.fileKey=i),this.upload(e.makeArray(e(t)[0].files),r)):t.id&&t.obj||(t=this.getFile(t));if(t&&t.obj){if(e.extend(t,r),this.files.length>=this.opts.connectionCount)return void this.queue.push(t);if(this.triggerHandler("beforeupload",[t])!==!1)return this.files.push(t),this._xhrUpload(t),this.uploading=!0}}},r.prototype.getFile=function(e){var t,r,n;return e instanceof window.File||e instanceof window.Blob?(t=null!=(r=e.fileName)?r:e.name,{id:this.generateId(),url:this.opts.url,params:this.opts.params,fileKey:this.opts.fileKey,name:t,size:null!=(n=e.fileSize)?n:e.size,ext:t?t.split(".").pop().toLowerCase():"",obj:e}):null},r.prototype._xhrUpload=function(t){var r,n,o,i;if(r=new FormData,r.append(t.fileKey,t.obj),r.append("original_filename",t.name),t.params){o=t.params;for(n in o)i=o[n],r.append(n,i)}return t.xhr=e.ajax({url:t.url,data:r,processData:!1,contentType:!1,type:"POST",headers:{"X-File-Name":encodeURIComponent(t.name)},xhr:function(){var t;return t=e.ajaxSettings.xhr(),t&&(t.upload.onprogress=function(e){return function(t){return e.progress(t)}}(this)),t},progress:function(e){return function(r){return r.lengthComputable?e.trigger("uploadprogress",[t,r.loaded,r.total]):void 0}}(this),error:function(e){return function(r,n,o){return e.trigger("uploaderror",[t,r,n])}}(this),success:function(r){return function(n){return r.trigger("uploadprogress",[t,t.size,t.size]),r.trigger("uploadsuccess",[t,n]),e(document).trigger("uploadsuccess",[t,n,r])}}(this),complete:function(e){return function(r,n){return e.trigger("uploadcomplete",[t,r.responseText])}}(this)})},r.prototype.cancel=function(e){var t,r,n,o;if(!e.id)for(o=this.files,r=0,n=o.length;n>r;r++)if(t=o[r],t.id===1*e){e=t;break}return this.trigger("uploadcancel",[e]),e.xhr&&e.xhr.abort(),e.xhr=null},r.prototype.readImageFile=function(t,r){var n,o;return e.isFunction(r)?(o=new Image,o.onload=function(){return r(o)},o.onerror=function(){return r()},window.FileReader&&FileReader.prototype.readAsDataURL&&/^image/.test(t.type)?(n=new FileReader,n.onload=function(e){return o.src=e.target.result},n.readAsDataURL(t)):r()):void 0},r.prototype.destroy=function(){var t,r,n,o;for(this.queue.length=0,o=this.files,r=0,n=o.length;n>r;r++)t=o[r],this.cancel(t);return e(window).off(".uploader-"+this.id),e(document).off(".uploader-"+this.id)},r.i18n={"zh-CN":{leaveConfirm:"\u6b63\u5728\u4e0a\u4f20\u6587\u4ef6\uff0c\u5982\u679c\u79bb\u5f00\u4e0a\u4f20\u4f1a\u81ea\u52a8\u53d6\u6d88"}},r.locale="zh-CN",r}(t),n=function(e){return new r(e)}});