#!/usr/bin/env perl

$latex     = 'platex %O -kanji=utf8 -no-guess-input-enc -interaction=nonstopmode -file-line-error %S';
$bibtex    = 'pbibtex %O %B';
$dvipdf    = 'dvipdfmx %O -o %D %S';
$makeindex = 'mendex %O -o %D %S';
$biber     = 'biber %O --bblencoding=utf8 -u -U --output_safechars %S';
$pdf_mode  = 3;

$pvc_view_file_via_temporary = 0;
if ( $^O eq 'darwin' ) {
  $pdf_previewer = "open -ga /Applications/Skim.app"
} elsif ( $^O eq 'Linux' ) {
  $pdf_previewer = "xdg-open"
} elsif ( $^O eq 'MSWin32' ) {
  $pdf_previewer = 'SumatraPDF -reuse-instance'
}
