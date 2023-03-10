Open Story
===

[![Maintainability](https://api.codeclimate.com/v1/badges/f24d2f3e0ef478868f96/maintainability)](https://codeclimate.com/github/elct9620/open-story/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/f24d2f3e0ef478868f96/test_coverage)](https://codeclimate.com/github/elct9620/open-story/test_coverage) [![Test](https://github.com/elct9620/open-story/actions/workflows/test.yml/badge.svg)](https://github.com/elct9620/open-story/actions/workflows/test.yml)

「開放故事」是一個實驗性的專案，源於[程式的脈絡](https://blog.aotoki.me/posts/2022/12/16/write-better-program-by-add-the-context/)這篇文章所提及如果將程式仔細加入脈絡（Context）的話會有類似
小說的感覺，那麼基於小說的方式用程式描述世界觀，並讓使用者互動是否可行，進而產生了這個專案。

> 系統的設計是可擴充、可延伸修改的。

## 背景

這是一個剛出現的世界，因為某些原因我們的意識似乎能夠投影到這個世界產生一些影響，那麼我們能在這個世界做些什麼呢？


## 投影

指的是系統觀測（Observe）來自外部的訊息做出反應的行為。

### 觀測

| 名稱 | 說明                                                                   | 原始碼                |
|------|------------------------------------------------------------------------|-----------------------|
| 噗浪 | 當使用者使用關鍵字（`#OpenStory`）時有可能被觀測到，進而出現一些反應。 | `lib/openstory/plurk` |

> 噗浪是目前唯一跟這個世界連結的地方

### 行動

這個世界只會受到「文字」的影響，當符合條件的文字被觀測到時，會產生「行動」進而對世界造成影響。

| 路徑               | 說明           |
|--------------------|----------------|
| `app/actions`      | 行動細節的定義 |
| `config/router.rb` | 行動條件的定義 |

> 因為世界觀沒有被構築，因此只有簡單的敘述被產生、不會有任何狀態上的變化

## 世界觀（Worldview）

用於定義世界運作的要素，能夠被行動參照進而產生各種類型的變化。

> 舉例：生命概念、地區概念

### 子系統（Sub-system）

因為完整的世界過於複雜，因此被劃分為各種不同小的系統處理特定類型的情境。

> 舉例：戰鬥、探索

### 模型（Model）

抽象的描述特定事物的概念，能夠進一步被細分為「個體」「群體」跟「數值」兩種概念。

> 舉例：玩家（個體）、工會（群體）、生命力（數值）

### 法則（Rule）

能夠對模型造成影響的規則，可能會隨著時間改變其中的規則。

> 舉例：傷害公式、行動條件

### 事件（Event）

對世界的變化有重大影響的情報，只有在必要時會被記錄下來。

> 舉例：遺跡探索完畢（其他玩家無法探索）
