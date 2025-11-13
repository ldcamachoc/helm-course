HELM

helm search repo prometheus --max-col-width 20
helm show chart bitnami/wordpress
helm search repo cms --versions #show all versions
helm show readme bitnami/wordpress
helm show values bitnami/wordpress
helm repo updated
helm repo list
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo remove bitnami

helm install local-wp bitnami/wordpress --version=23.1.20

helm get values local-wp --all
helm get notes local-wp 
helm get metadata local-wp

kubectl get secret local-wp-mariadb -o jsonpath='{.data.mariadb-password}' | base64 -d

#To instal with set parameters
helm install local-wp bitnami/wordpress --version=23.1.20 \
 --set "mariadb.auth.rootPassword=myrootpassword" \
 --set "mariadb.auth.password=myuserpassword" 
 
helm get values local-wp # Just show the values differents of the default

---
mariadbRootPassword=$(...)
mariadbUserPassword=$(...)



helm install local-wp bitnami/wordpress --version=23.1.20 \
 --set "mariadb.auth.rootPassword=$mariadbRootPassword" \
 --set "mariadb.auth.password=$mariadbUserPassword" 

---

To install with values

helm install local-wp bitnami/wordpress -f custom-values.yaml
helm upgrade --reuse-values --values setting-values/custom-values.yaml local-wp bitnami/wordpress #important to set the version and the flag --reuse-values
helm history local-wp
helm get values local-wp --revision=1
helm get values local-wp --revision=2
helm upgrade --reuse-values --values setting-values/custom-values.yaml local-wp bitnami/wordpress --version=27.1.3
helm upgrade --reuse-values --values setting-values/custom-values.yaml local-wp bitnami/wordpress --set "image.tag=noexisttag" --version=27.1.3
helm rollback local-wp 3
helm upgrade --reuse-values \
--values setting-values/custom-values.yaml \
local-wp bitnami/wordpress \
--set "image.tag=noexisttag" \ 
--version=27.1.3 \
--atomic \
--cleanup-on-fail \
--debug  \
--timeout=2m 


---
helm template nginx
helm lint nginx
--------

helm package nginx # Create
helm install local-nginx nginx-0.1.1.tgz #Install from file

----

helm template . --debug