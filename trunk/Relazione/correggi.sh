#!/bin/bash
find . -name "*.tex" -exec aspell --mode=tex --lang=it check "{}" \; 
