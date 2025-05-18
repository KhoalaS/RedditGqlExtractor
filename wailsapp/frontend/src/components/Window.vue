<script setup lang="ts">
import { WindowButton } from '../utils/Types';

defineProps<{
  title: string;
  buttons?: WindowButton[];
  windowOpts?: {
    hasSpace?: boolean;
  };
}>();
</script>
<template>
  <div class="window active">
    <div class="title-bar">
      <div class="title-bar-text">{{ title }}</div>
      <div class="title-bar-controls">
        <button
          @click="btn.onClick"
          v-for="btn in buttons"
          :aria-label="btn.label"
        ></button>
      </div>
    </div>
    <div class="window-body" :class="{ 'has-space': windowOpts?.hasSpace }">
      <slot name="content"> </slot>
    </div>
  </div>
</template>
