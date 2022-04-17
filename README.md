---
layout: null
permalink: /README.md
---
{::nomarkdown}
# Graphics Repository Collection

This is a collection of repostiories related to computer graphics from github.

You can check the generated markdown from [gh-pages](https://github.com/crescent3983/GraphicsRepoCollection/blob/gh-pages/README.md) branch but I suggest you view from [website](https://crescent3983.github.io/GraphicsRepoCollection/) directly which has a better layout.

If you have any interesting projects, feel free to create an issue to let me know.

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