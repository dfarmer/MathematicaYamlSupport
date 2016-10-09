Mathematica YAML Support
==========================

This is just a quick wrapper around SnakeYaml to get YAML data into associations. I'm not quite happy with it as is, 
but figured I'd share it for anyone who could use it (maybe you can help!)

Installation
=============
Still not sure if there is a better route but for now:
 
 1. Clone or download
 2. Unzip to $UserBaseDirectory ~~ "\\Applications" (Evaluate that in Mathematica to get the path)
 3. Should now be able to load it with Needs["YamlSupport`"]

TODO
=======
* The JavaBlock stuff isn't quite right and it still seems to "leak" Java objects.
* Make it easier to install?

License
========= 
SnakeYaml is Apache 2.0, I like it as well so the Mathematica wrapper is also Apache 2.0 (see LICENSE).
