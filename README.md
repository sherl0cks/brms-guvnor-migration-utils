# brms-guvnor-migration-utils
Simple tools to migrate BRMS 5 Guvnor repos to BxMS 6. These are to be used in addition to [the supported migration tools and guides](https://access.redhat.com/documentation/en-US/Red_Hat_JBoss_BPM_Suite/6.2/html/Migration_Guide/index.html).

## Common Stuff

- Issues/PR's welcome
- These scripts are based on defaults (e.g. users) in my [Guvnor Docker containers](https://hub.docker.com/r/sherl0cks/brms-guvnor/)
- If you use the docker container, generate the example repo to get started in Guvnor.

## List of Artifacts

##### downloadSourceFromGuvnorSnapshots.sh
Like the name suggests, this tool uses [Guvnor's WebDav interface](http://docs.jboss.org/drools/release/5.4.0.Final/drools-guvnor-docs/html/ch09.html#d0e3750) to download all the source files from a [Guvnor Snapshot](http://docs.jboss.org/drools/release/5.4.0.Final/drools-guvnor-docs/html/ch07.html#d0e2774). Since snapshot were a common deployment mechanism, this approach will allow you retrieve the source from the snapshot so it can moved to [BxMS KieJar's](https://access.redhat.com/documentation/en-US/Red_Hat_JBoss_BPM_Suite/6.2/html/Development_Guide/chap-KIE_API.html). This is just the start of this approach and it can be extended in many ways, such as generating the maven achetype for the KJar and adding the resources to it.
