
import ProjectDescription

let project = Project(name: "PhotoEditor",
                      organizationName: "Pawan",
                      targets: [
                        Target(name: "PhotoEditor",
                               platform: .iOS,
                               product: .app,
                               bundleId: "ios.pawan.photoeditor",
                               deploymentTarget: .iOS(targetVersion: "13.0",
                                                      devices: [.iphone, .ipad]),
                               infoPlist: "Config/PhotoEditor.plist",
                               sources: ["Sources/PhotoEditor/**/*.swift"],
                               resources: ["Sources/PhotoEditor/**"],
                               dependencies: [
                                .target(name: "PhotoEditorKit")
                               ]),
                        Target(name: "PhotoEditorKit",
                               platform: .iOS,
                               product: .framework,
                               bundleId: "ios.pawan.photoeditorkit",
                               deploymentTarget: .iOS(targetVersion: "13.0",
                                                      devices: [.iphone, .ipad]),
                               infoPlist: "Config/PhotoEditorKit.plist",
                               sources: ["Sources/PhotoEditorKit/**/*.swift"],
                               resources: ["Sources/PhotoEditorKit/**"],
                               dependencies: [])
                      ])
