<script lang="ts" setup>
import { computed, ref } from 'vue';
import { OpenSchemaFile, GetType } from '../../wailsjs/go/main/App';
import { useVirtualList } from '@vueuse/core';
import { main, utils } from '../../wailsjs/go/models';
import ListView from './ListView.vue';
import Window from './Window.vue';
import { ControlButton } from '../utils/Types';

const exTypes = ref<main.MinimalType[]>([]);

const onclick = async (event: Event) => {
  const res = await OpenSchemaFile();
  if (!res.error) {
    exTypes.value = res.data;
  } else {
    console.log(res.error);
  }
};

const filterText = ref('');

const filteredExTypes = computed(() => {
  if (filterText.value.length > 0) {
    return exTypes.value.filter((val) => {
      return val.typename
        .toLowerCase()
        .startsWith(filterText.value.toLowerCase());
    });
  } else {
    return exTypes.value;
  }
});

const { list, containerProps, wrapperProps } = useVirtualList(filteredExTypes, {
  itemHeight: 22,
});

const activeType = ref<utils.ExtractedType | undefined>();
const mergeType = ref<utils.ExtractedType>({
  fields: [],
  typeName: '',
  convertValues: () => {},
});
const mergedTypename = ref('');

const clickTypename = async (type: main.MinimalType) => {
  activeType.value = await GetType(type.filename);
};

const controlButtons: ControlButton[] = [
  {
    label: 'Merge',
    onClick: () => {
      mergedTypename.value = activeType.value!.typeName;
      for (const field of activeType.value!.fields) {
        const dupe = mergeType.value.fields.findIndex(
          (val) => val.name == field.name
        );
        if (dupe != -1) {
          mergeType.value.fields[dupe] = field;
        } else {
          mergeType.value.fields.push(field);
        }
      }
    },
    class: 'default',
  },
];
</script>

<template>
  <main style="display: flex">
    <div style="width: 300px; margin: 8px">
      <div style="display: flex; gap: 4px; height: 24px">
        <button @click="onclick">Open file</button>
        <input type="search" placeholder="Search" v-model="filterText" />
      </div>
      <div
        class="has-scrollbar"
        v-bind="containerProps"
        style="height: calc(100% - 24px)"
      >
        <div v-bind="wrapperProps">
          <div
            @click="clickTypename(type.data)"
            v-for="type in list"
            style="height: 22px"
          >
            {{ type.data.typename }}
          </div>
        </div>
      </div>
    </div>
    <div style="flex-grow: 1; padding: 16px; overflow-y: scroll">
      <Window
        v-if="activeType"
        :title="activeType.typeName"
        :titleBarButtons="[
          { label: 'Close', onClick: () => (activeType = undefined) },
        ]"
        :window-opts="{ hasSpace: true }"
        :control-buttons="controlButtons"
        style="width: fit-content"
      >
        <template #content>
          <ListView
            :header="['Typename', 'Default', 'Java Type', 'GQL Type']"
            :data="activeType.fields"
          ></ListView>
        </template>
      </Window>
      <Window
        title="Merged Type"
        :window-opts="{ hasSpace: true }"
        style="width: fit-content"
        :control-buttons="[
          {
            label: 'Clear',
            onClick: () => {
              mergeType.fields = [];
              mergedTypename = '';
            },
          },
        ]"
      >
        <template #content>
          <div class="field-row">
            <label for="merged-name">Merged Typename:</label>
            <input v-model="mergedTypename" id="merged-name" type="text" />
          </div>
          <ListView
            :header="['Typename', 'Default', 'Java Type', 'GQL Type']"
            :data="mergeType.fields"
          ></ListView>
        </template>
      </Window>
    </div>
  </main>
</template>

<style scoped></style>

