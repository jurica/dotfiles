#!/usr/bin/env nu

def main [] {
    let test = $env.FILE_PWD
    print $test
    print $"($env.CURRENT_FILE)"
    #$nu.config-path
}
