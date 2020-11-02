<?php
$d = dir("./");echo "Handle: ".$d->handle."<br>\n";echo "Path: ".$d->path."<br>\n";
while($entry=$d->read()) {
    echo $entry."<br>\n";
}
$d->close();