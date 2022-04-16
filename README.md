---
layout: null
permalink: /README.md
---
{::nomarkdown}
# Graphics Repository Collection

{% for topic in site.data.topics %}
## {{topic.name}}
{% for project in site.data.project_list[topic.name] %}
<table> <tbody> <tr> <td align="left" width=250>
{% capture url%}{{project.author}}/{{project.name}}{% endcapture %}
<a href="https://github.com/{{url}}"><img src="{{ project.image }}" alt="{{project.name}}"/></a></td>
<td align="left" width=600>{{project.name}}<br>
{{project.description}}<br>
☆ {{ project.stargazers_count }} <br>
Last Modified {{ project.pushed_at | date: "%Y-%m-%d" }} <br>
</td></tr></tbody></table>
{% endfor %}
{% endfor %}

{:/nomarkdown}