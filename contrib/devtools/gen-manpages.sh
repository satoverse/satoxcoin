#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

SATOXCOIND=${SATOXCOIND:-$SRCDIR/satoxcoind}
SATOXCOINCLI=${SATOXCOINCLI:-$SRCDIR/satoxcoin-cli}
SATOXCOINTX=${SATOXCOINTX:-$SRCDIR/satoxcoin-tx}
SATOXCOINQT=${SATOXCOINQT:-$SRCDIR/qt/satoxcoin-qt}

[ ! -x $SATOXCOIND ] && echo "$SATOXCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
SATOXVER=($($SATOXCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for satoxcoind if --version-string is not set,
# but has different outcomes for satoxcoin-qt and satoxcoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$SATOXCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $SATOXCOIND $SATOXCOINCLI $SATOXCOINTX $SATOXCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${SATOXVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${SATOXVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
