# Sample Markdown

This is some basic, sample markdown.

## Second Heading

- Unordered lists, and:
  1.  One
  2.  Two
  3.  Three
- More

> <p>Words can be like X-rays, if you use them properly they’ll go through anything. You read and you’re pierced.</p>
> <footer>--Aldous Huxley, <cite>Brave New World</cite></footer>

And **bold**, _italics_, and even _italics_ and later **bold**. Even ~~strikethrough~~. [A link](https://markdowntohtml.com) to somewhere.

And code highlighting:

```js
//@ts-check

/**
 * @returns {string}
 */
export function generateId() {
  const cs = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  const bs = new Uint8Array(16);
  crypto.getRandomValues(bs);

  let id = "";
  for (const b of bs) {
    const randomIndex = b % cs.length;
    id += cs[randomIndex];
  }

  return id;
}
```

Or inline code like `var foo = 'bar';`.

Or an image of bears

![An image of a bear](http://placebear.com/200/200)

Thisisareallylongwordthatshouldbebrokenupinsteadofoverflowingasdasdasdasdasasfasfasfasf
