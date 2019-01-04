$(document).ready(function() {
    tinymce.init({
        selector: '.full-editor',
        height: 500,
        convert_urls: false,
        remove_script_host: false,
        forced_root_block: "",
        valid_elements : '*[*],meta[*]',
        extended_valid_elements : "meta[*]",
        valid_children : "+body[meta],+div[h2|span|meta|object],+object[param|embed]",
        plugins: [
          'table advlist autolink lists link image charmap print preview anchor directionality',
          'searchreplace visualblocks code fullscreen textcolor',
          'insertdatetime media contextmenu paste code'
        ],
        toolbar: 'insertfile undo redo | fontselect | fontsizeselect | styleselect | bold italic | forecolor backcolor | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image media | ltr rtl',
        content_css: [
          APP_URL.replace('/index.php','')+'/tinymce/skins/lightgray/content.fixed.css',
          APP_URL.replace('/index.php','')+'/css/all.css',
          APP_URL.replace('/index.php','')+'/css/page.css',
        ],

        external_filemanager_path:APP_URL.replace('/index.php','')+"/filemanager/",
        filemanager_title:"Responsive Filemanager" ,
        external_plugins: { "filemanager" : APP_URL.replace('/index.php','')+"/filemanager/plugin.min.js"}
    });

    tinymce.init({
        selector: '.email-editor',
        height: 500,
        convert_urls: false,
        remove_script_host: false,
        forced_root_block: "",
        valid_elements : '*[*],meta[*]',
        extended_valid_elements : "meta[*]",
        valid_children : "+body[meta],+div[h2|span|meta|object],+object[param|embed]",
        plugins: [
          'table advlist autolink lists link image charmap print preview anchor fullpage',
          'searchreplace visualblocks code fullscreen textcolor',
          'insertdatetime media contextmenu paste code'
        ],
        toolbar: 'insertfile undo redo | fontselect | fontsizeselect | styleselect | bold italic | forecolor backcolor | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image media | ltr rtl',
        content_css: [
          APP_URL.replace('/index.php','')+'/tinymce/skins/lightgray/content.fixed.css',
          APP_URL.replace('/index.php','')+'/css/email.css',
        ],

        external_filemanager_path:APP_URL.replace('/index.php','')+"/filemanager/",
        filemanager_title:"Responsive Filemanager" ,
        external_plugins: { "filemanager" : APP_URL.replace('/index.php','')+"/filemanager/plugin.min.js"}
    });

    tinymce.init({
        selector: '.clean-editor',
        height: 500,
        convert_urls: false,
        remove_script_host: false,
        forced_root_block: "",
        plugins: [
          'table advlist autolink lists link image charmap print preview anchor directionality',
          'searchreplace visualblocks code fullscreen',
          'insertdatetime media contextmenu paste code textcolor'
        ],
        toolbar: 'insertfile undo redo | fontselect | fontsizeselect | styleselect | bold italic | forecolor backcolor | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image media | ltr rtl',
        valid_elements : '*[*],meta[*]',
        extended_valid_elements : "meta[*]",
        valid_children : "+body[style],+body[meta],+div[h2|span|meta|object],+object[param|embed]",
        content_css: [
            APP_URL.replace('/index.php','')+'/tinymce/skins/lightgray/content.fixed.css',
        ],
        external_filemanager_path:APP_URL.replace('/index.php','')+"/filemanager/",
        filemanager_title:"Responsive Filemanager" ,
        external_plugins: { "filemanager" : APP_URL.replace('/index.php','')+"/filemanager/plugin.min.js"}
    });

    tinymce.init({
        selector: '.builder-editor',
        height: 300,
        convert_urls: false,
        remove_script_host: false,
        forced_root_block: "",
        plugins: [
          'table advlist autolink lists link image charmap print preview anchor directionality',
          'searchreplace visualblocks code fullscreen',
          'insertdatetime media contextmenu paste code textcolor'
        ],
        toolbar: 'insertfile undo redo | fontselect | fontsizeselect | styleselect | bold italic | forecolor backcolor | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image media | ltr rtl',
        valid_elements : '*[*],meta[*]',
        extended_valid_elements : "meta[*]",
        valid_children : "+body[style],+body[meta],+div[h2|span|meta|object],+object[param|embed]",
        content_css: [
          APP_URL.replace('/index.php','')+'/css/res_email.css',
          APP_URL.replace('/index.php','')+'/css/editor.css',
        ],
        external_filemanager_path:APP_URL.replace('/index.php','')+"/filemanager/",
        filemanager_title:"Responsive Filemanager" ,
        external_plugins: { "filemanager" : APP_URL.replace('/index.php','')+"/filemanager/plugin.min.js"}
    });
});
