#!/bin/bash

#echo "Actualizando todos los submódulos..."
#if git submodule update --remote --recursive; then
#    echo "Submódulos actualizados correctamente."
#else
#    echo "Error al actualizar los submódulos."
#    exit 1
#fi

set -e

echo "🔄 Actualizando submódulos al último tag semántico v-* y ejecutando Terraform..."

SUBMODULES=("compute-repo" "network-repo" "storage-repo")

for MODULE in "${SUBMODULES[@]}"; do
    echo "📦 Procesando $MODULE..."

    cd "$MODULE"
    
    # Obtener tags desde el remoto
    git fetch --tags

    # Buscar el último tag semántico (v-*)
    LATEST_TAG=$(git tag -l 'v-*' --sort=-v:refname | head -n 1)

    if [ -z "$LATEST_TAG" ]; then
        echo "❌ No hay tags válidos en $MODULE"
        cd ..
        continue
    fi

    echo "✅ Último tag: $LATEST_TAG"
    git checkout "$LATEST_TAG"

    # Ejecutar terraform solo si hay archivos .tf
    if ls *.tf >/dev/null 2>&1; then
        echo "🚀 Ejecutando Terraform en $MODULE..."
        terraform init -input=false
        terraform apply -auto-approve
    else
        echo "⚠️ No hay archivos .tf en $MODULE, saltando Terraform."
    fi

    cd ..
done

echo "✅ Todos los submódulos actualizados al último tag semántico"
