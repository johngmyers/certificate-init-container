FROM       golang:1.10.0-alpine
ADD        . /go/src/github.com/proofpoint/certificate-init-container
RUN        go install github.com/proofpoint/certificate-init-container &&
           go test ./...

FROM alpine
COPY --from=0 /go/bin/certificate-init-container .
ENTRYPOINT ["/certificate-init-container"]
