# Protobuf Interface Example

## Getting Started

These tools are required to use this project:

- Docker CLI (or Desktop)
- VS Code + `ms-vscode-remote.remote-containers` extension
- git

Get ready for development:

- Start the docker daemon by starting ether Docker Desktop or in case of using Docker CLI directly the Docker daemon.
- Clone the project: `git clone git@github.com:Tamaluga/protobuf-interface-example.git`
- Start vs code: `code protobuf-interface-example`
- Start container in vs code by pressing `Ctrl+Shift+P` and inserting `>Dev Containers: Reopen Folder in Container`

## Update and build the interface

1. Create and checkout a new git branch
2. Make the needed updates in the [Robot.proto](interface/Robot.proto) file.
3. Update the version in the [version.txt](version.txt) file
4. Generate the protobuf interface with the [generate-interface.sh](scripts/generate-interface.sh) script
5. Commit and push the changes and create a PR

On a successful PR the new commit gets tagged with the new version and a nuget package is published under the same version.