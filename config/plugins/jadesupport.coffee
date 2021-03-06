module.exports = (lineman) ->
  app = lineman.config.application
  if lineman.config.files.jade
    files:
      jade:
        jadeRoot: "app/riottags/"
        genJadetags: "generated/temptags"
    
    config:
      jade:
        jadeTag:
          files: [{
            expand: true
            src: "<%= files.jade.pages %>"
            cwd: "<%= files.jade.jadeRoot %>"
            dest: "<%= files.jade.genJadetags %>"
            ext: ".tag"
          }]
      prependTasks:
        common: ["jade:jadeTag"].concat app.prependTasks.common
      appendTasks:
        common: app.appendTasks.concat["clean"]
