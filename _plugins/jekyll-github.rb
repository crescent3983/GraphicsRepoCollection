require 'open-uri'
require 'json'

module Jekyll
    class ProjectGenerator < Jekyll::Generator
        def generate(site)
            project_list = {}
            site.data['projects'].each { |project|
                begin
                    info = JSON.load(URI.open('https://api.github.com/repos/' + project['author'] + '/' + project['name']))
                    project['stargazers_count'] = info['stargazers_count']
                    project['pushed_at'] = info['pushed_at']
                rescue
                    project['stargazers_count'] = 0
                    project['pushed_at'] = '1970/01/01'
                end

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

    class TopicGenerator < Jekyll::Generator
        def generate(site)
            site.data['topics'].each do |topic|
                site.pages << TopicPage.new(site, topic)
            end
        end
    end

    class TopicPage < Jekyll::Page
        def initialize(site, topic)
            @site = site
            @dir  = "topics"

            @basename = topic['name']
            @ext      = '.html'
            @name     = basename + ext
     
            @data = {
                "layout" => "projects",
                "title" => topic['name'],
            }
        end

        def template
            "/:path/:basename:output_ext"
        end

        def url_placeholders
            {
              :path       => @dir,
              :basename   => basename,
              :output_ext => output_ext,
            }
        end
    end
end
