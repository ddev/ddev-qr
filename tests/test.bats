setup() {
  set -eu -o pipefail
  export DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )/.."
  export PROJNAME=test-ddev-qr
  export TESTDIR=~/tmp/test-ddev-qr
  mkdir -p $TESTDIR
  export DDEV_NON_INTERACTIVE=true
  ddev delete -Oy ${PROJNAME} >/dev/null 2>&1 || true

  # Copy over an expected code for testing
  cp tests/testdata/expected-qrcode.txt "${TESTDIR}/expected-qrcode.txt"

  cd "${TESTDIR}"
  ddev config --project-name=${PROJNAME}
}

teardown() {
  set -eu -o pipefail
  cd ${TESTDIR} || ( printf "unable to cd to ${TESTDIR}\n" && exit 1 )
  ddev delete -Oy ${PROJNAME} >/dev/null 2>&1
  [ "${TESTDIR}" != "" ] && rm -rf ${TESTDIR}
}

health_checks() {
  # Generate a QR code and compare it to confirmed working code.
  # Note: "expected-qrcode.txt" may not display correctly in your text editor.
  ddev qr > qrcode.txt
  run diff qrcode.txt "${TESTDIR}/expected-qrcode.txt"
  [ "$status" -eq 0 ]

  # Our command uses jq to parse the ngrok url. Check that it's installed
  ddev . jq --help | grep 'commandline JSON processor'
}

@test "install from directory" {
  set -eu -o pipefail
  cd ${TESTDIR}
  echo "# ddev add-on get ${DIR} with project ${PROJNAME} in ${TESTDIR} ($(pwd))" >&3
  ddev add-on get ${DIR}
  ddev restart
  health_checks
}

# bats test_tags=release
@test "install from release" {
  set -eu -o pipefail
  cd ${TESTDIR} || ( printf "unable to cd to ${TESTDIR}\n" && exit 1 )
  echo "# ddev add-on get tyler36/ddev-qr with project ${PROJNAME} in ${TESTDIR} ($(pwd))" >&3
  ddev add-on get tyler36/ddev-qr
  ddev restart >/dev/null
  health_checks
}
