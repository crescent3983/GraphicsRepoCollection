---
layout: null
permalink: /README.md
---
{::nomarkdown}
# Graphics Repository Collection

A collection of awesome computer graphics projects I found on github.

You can view directly in generated [Markdown](https://github.com/crescent3983/GraphicsRepoCollection/blob/gh-pages/README.md) or through the [Website](https://crescent3983.github.io/GraphicsRepoCollection/) which is more recommended.

If you found any interesting projects, feel free to create an issue to let me know.

{% for topic in site.data.topics %}
## {{topic.name}}
{% for project in site.data.project_list[topic.name] %}
<table> <tbody> <tr> <td align="left" width=250>
{% capture url%}{{project.author}}/{{project.name}}{% endcapture %}
<a href="https://github.com/{{url}}"><img src="{{ project.image }}" alt="{{project.name}}"/></a></td>
<td align="left" width=600>{{project.author}}/{{project.name}}<br>
{{project.description}}<br>
☆ {{ project.stargazers_count }} <br>
<i>Last Modified {{ project.pushed_at | date: "%Y-%m-%d" }}</i> <br>
</td></tr></tbody></table>
{% endfor %}
{% endfor %}

{:/nomarkdown}