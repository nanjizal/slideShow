let project = new Project('MainKha');
project.addSources('src');
project.addAssets('Assets/**');
project.addLibrary('tweenx');
resolve(project);
