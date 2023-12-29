V=$1

cd App/Pods/TensorFlowLiteC/Frameworks

for f in *.xcframework
do
  sh ../../../../Scripts/convert.sh $f
done

sed -e s/VERSION/$V/g \
    -e s/CORE_CHECKSUM/`cat TensorFlowLiteC.xcframework`/ \
    -e s/COREML_CHECKSUM/`cat TensorFlowLiteCCoreML.xcframework`/ \
    -e s/METAL_CHECKSUM/`cat TensorFlowLiteCMetal.xcframework`/ \
    ../../../../Package.swift.in \
    > ../../../../Package.swift
