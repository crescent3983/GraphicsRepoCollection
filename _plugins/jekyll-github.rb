require 'open-uri'
require 'json'

module Jekyll
    class ProjectGenerator < Jekyll::Generator
        def generate(site)
            project_list = {}
            site.data['projects'].each { |project|
                info = JSON.load(URI.open('https://api.github.com/repos/' + project['author'] + '/' + project['name']))
                project['stargazers_count'] = info['stargazers_count']
                project['pushed_at'] = info['pushed_at']

                project['topics'].each { |topic|
                    unless project_list.key?(topic)
                        project_list[topic] = []
                    end
                    project_list[topic].append(project)
                }
            }
            site.data['project_list'] = project_list
        end
    end
end
