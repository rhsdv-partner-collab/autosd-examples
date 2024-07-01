VERSION = 0.1.0

NAMESPACE = autosd

.PHONY: namespace
namespace:
	oc new-project ${NAMESPACE}
	oc new-project ${NAMESPACE}-build

.PHONY: bootstrap
bootstrap:
	oc apply -f bootstrap -n ${NAMESPACE}-build

.PHONY: cleanup
cleanup:
	oc delete build --all -n "${NAMESPACE}-build"
	oc delete pipelineruns,taskruns --all -n "${NAMESPACE}-build"
	oc delete pod --field-selector=status.phase==Succeeded -n "${NAMESPACE}-build"
	oc delete pod --field-selector=status.phase==Failed -n "${NAMESPACE}-build"