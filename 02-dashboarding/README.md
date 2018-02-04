# Second demo: custom dashboarding with grafana

 - Launch with `docker-compose up -d` or `./launch.sh`
 - Access prometheus on http://localhost:9090
 - View new targets
 - Access grafana on http://localhost:3000
 - Config datasource
   - Host: http://localhost:9090
   - Connexion: Direct
   - Scraping interval: 1s
 - Import dashboard *395*
 - Fix label: container_group => container_label_container_group
 - Import dashboard *718* or *1860*
 - See how it's boring...
 - Let's talk about immutable infrastructure