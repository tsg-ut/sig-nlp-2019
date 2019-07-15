[Stanford CS224N](http://web.stanford.edu/class/cs224n/)からAssignment 1のcodeをダウンロードしてください。

```bash
patch -u path/to/exploring_word_vectors.ipynb <02_word2vec/1/exploring_word_vectors.ipynb.diff
```

とすると，Question 1.1-4が記入済みのNotebookが生成されます。`patch`がない人は…ウーン

訓練済み単語埋め込みベクトルを試すPart 2では1.6GBのデータをダウンロードするので，ストレージの空き容量に注意。ローカルで実行したくなければGoogle Colaboratory上などで実行すると良さそう。
