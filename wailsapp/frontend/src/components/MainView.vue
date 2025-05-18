<script lang="ts" setup>
import { computed, ref } from 'vue';
import { OpenSchemaFile, GetType } from '../../wailsjs/go/main/App';
import { useVirtualList } from '@vueuse/core';
import { main, utils } from '../../wailsjs/go/models';
import ListView from './ListView.vue';
import Window from './Window.vue';

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

const clickTypename = async (type: main.MinimalType) => {
  activeType.value = await GetType(type.filename);
};
</script>

<template>
  <main style="display: flex">
    <div style="width: 300px; margin: 8px">
      <div style="display: flex; gap: 4px; height: 24px">
        <button @click="onclick">Open file</button>
        <input type="search" placeholder="Search" v-model="filterText" />
      </div>
      <div v-bind="containerProps" style="height: calc(100% - 24px)">
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
    <div style="flex-grow: 1; margin: 8px; overflow-y: scroll">
      <Window
        v-if="activeType"
        :title="activeType.typeName"
        :buttons="[{ label: 'Close', onClick: () => (activeType = undefined) }]"
      >
        <template #content>
          <ListView
            :header="['Typename', 'Default', 'Java Type']"
            :data="activeType.fields"
          ></ListView>
        </template>
      </Window>
    </div>
  </main>
</template>

<style scoped></style>

