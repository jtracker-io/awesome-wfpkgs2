FROM pegi3s/fastqc:0.11.9

LABEL org.opencontainers.image.source https://github.com/jtracker-io/awesome-wfpkgs1

ENV PATH="/tools:${PATH}"

COPY *.py /tools/

ENTRYPOINT ["/usr/bin/env"]

CMD ["/bin/bash"]
